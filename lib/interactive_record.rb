require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'pry'

class InteractiveRecord
  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    DB[:conn].results_as_hash = true

    sql = "PRAGMA table_info('#{table_name}');"

    raw_table_headers = DB[:conn].execute(sql)
    table_headers = Array.new

    raw_table_headers.each do |column|
      table_headers << column["name"]
    end

    binding.pry
  end
end
