require_relative 'db_connection'
require 'active_support/inflector'
require 'byebug'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    # return @column_names if @column_names
    table = self.table_name
    @entire_table ||= DBConnection::execute2(<<-SQL)
      SELECT
        *
      FROM
        #{table}
    SQL
    @column_names = @entire_table.first
      .map(&:to_sym)
  end

  def self.finalize!
    columns.each do |name|
      getter_name = name.to_sym
      setter_name = (name.to_s + "=").to_sym
      define_method(getter_name) do
        attributes[name.to_sym]
      end
      define_method(setter_name) do |value|
        attributes[name.to_sym] = value
      end
    end
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.tableize
    @table_name
  end

  def self.all
    results = DBConnection::execute(<<-SQL)
      SELECT
        *
      FROM
        #{@table_name}
    SQL

    self.parse_all(results)
  end

  def self.parse_all(results)
    array = []
    results.each do |hash|
      array << self.new(hash)
    end
    array
  end

  def self.find(id)
    result = DBConnection::execute(<<-SQL, id)
      SELECT
        *
      FROM
        #{@table_name}
      WHERE
        id = ?
    SQL

    if result.empty?
      return nil
    else
      self.new(result.first)
    end
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      raise "unknown attribute '#{attr_name}'" unless self.class.columns.include?(attr_name.to_sym)
      getter_name = "#{attr_name}=".to_sym
      self.send(getter_name, value)
    end
  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    self.class.columns.map do |name|
      self.send(name.to_sym)
    end
  end

  def insert
    cols = self.class.columns
    list_of_cols = cols[1..-1].join(", ")
    num_qs = cols.length
    question_mark_array = ["?"] * (num_qs - 1)
    question_marks = question_mark_array.join(", ")
    question_marks = "(#{question_marks})"
    table_name = self.class.table_name

    insert_string = "#{table_name} (#{list_of_cols})"

    args = attribute_values

    DBConnection::execute(<<-SQL, *args[1..-1])
    INSERT INTO
      #{insert_string}
    VALUES
      #{question_marks}
    SQL

    @attributes[:id] = DBConnection.last_insert_row_id

  end

  def update
    cols = self.class.columns
    list_of_cols = cols[1..-1].join(" = ?, ")
    set_line = "#{list_of_cols} = ?"

    table_name = self.class.table_name

    args = attribute_values
    id = args[0]
    DBConnection::execute(<<-SQL, *args[1..-1], id)
    UPDATE
      #{table_name}
    SET
      #{set_line}
    WHERE
      id = ?
    SQL
  end

  def save
    if @attributes
      update
    else
      insert
    end
  end

end
