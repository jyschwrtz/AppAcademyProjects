require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    where_line = params
                  .keys
                  .map { |key| "#{key} = ?" }
                  .join(" AND ")

    args = params.values
    table_name
    results = DBConnection::execute(<<-SQL, *args)
      SELECT
        *
      FROM
        #{table_name}
      WHERE
        #{where_line}
    SQL

    self.parse_all(results)
  end
end

class SQLObject
  extend Searchable
end
