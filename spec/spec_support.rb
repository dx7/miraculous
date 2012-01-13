require 'active_record'
require File.expand_path(File.dirname(__FILE__) + '/../lib/miraculous.rb')

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: ':memory:')

ActiveRecord::Schema.define do
  create_table :users do |t|
    t.string :name
    t.integer :age
  end
end

class User < ActiveRecord::Base
  #validates_presence_of :name
end
