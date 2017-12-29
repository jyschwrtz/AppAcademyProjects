require 'active_support/inflector'

class ModelBase
  def self.table
    self.to_s.tableize
  end

  def self.find_by_id(id)
    table =  self.to_s.tableize

    data = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{table}
      WHERE
        id = ?
    SQL

    self.new(data.first)
  end

  def self.all
    table = self.to_s.tableize

    data = QuestionsDatabase.instance.execute(<<-SQL)
      SELECT
        *
      FROM
        #{table}
    SQL

    data.map { |data| self.new(data) }
  end

  def save
    variables = self.instance_variables
    hash = Hash.new

    variables.each do |var|
      value = var.to_s
      hash[var.to_s.delete("@")] = self.instance_variable_get(value)
    end

    table =  self.class.to_s.tableize
    set_string = hash.keys[1..-1].map { |k| "#{k} = ?"}.join(", ")
    insert_string = hash.keys[1..-1].map { |k| "#{k}"}.join(", ")
    input_update = hash.values[1..-1] + [hash.values[0]]
    input_create = hash.values[1..-1]
    if @id
      QuestionsDatabase.instance.execute(<<-SQL, *input_update)
        UPDATE
          #{table}
        SET
          #{set_string}
        WHERE
          id = ?
      SQL
    else
      QuestionsDatabase.instance.execute(<<-SQL, *input_create)
        INSERT INTO
          #{table} (#{insert_string})
        VALUES
          (?, ?)
      SQL
      @id = QuestionsDatabase.instance.last_insert_row_id
    end
  end

  def self.where(options)
    if options.is_a?(Hash)
      set_string = options.keys.map { |k| "#{k} = ?"}.join(" AND ")
      values = options.values
    else
      set_string = options
    end
    table = self.to_s.tableize

    data = QuestionsDatabase.instance.execute(<<-SQL, *values)
    SELECT
      *
    FROM
      #{table}
    WHERE
      #{set_string}
    SQL

    data.map { |data| self.new(data) }
  end

  def self.method_missing(method_name, *args)
    method_name = method_name.to_s
    if method_name.start_with?("find_by_")
      hash = Hash.new
      text = method_name[("find_by_".length)..-1].split("_and_")
      text.each_index do |i|
        hash[text[i]] = args[i]
      end
      self.where(hash)
    end
  end

end
