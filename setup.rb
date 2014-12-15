require 'bundler/setup'
require 'sqlite3'
require 'lotus/model'
require 'lotus/model/adapters/sql_adapter'

CONNECTION_URI = "sqlite://#{ __dir__ }/test.db"

database = Sequel.connect(CONNECTION_URI)

database.create_table! :tasks do
  primary_key :id
  String :name
end
#sqlite
#|
#v
#CREATE TABLE 'task' (id INTEGER PRIMARY KEY, name varchar(255));