require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'pry'

class InteractiveRecord
  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    sql = <<-SQL
      PRAGMA table_info();
    SQL
    binding.pry
  end
end
