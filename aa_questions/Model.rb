require 'active_support/inflector'
require_relative 'main'

class ModelBase
  def self.find_by_id(id)
    table = self.to_s.downcase.pluralize
    p table
    data = QuestionsDatabase.instance.execute(<<-SQL, :table, id)
      SELECT
        *
      FROM
        table
      WHERE
        id = ?
    SQL

    self.new(data.first)
  end
end
