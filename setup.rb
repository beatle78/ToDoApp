require 'bundler/setup'
require 'sqlite3'
require 'lotus/model'
require 'lotus/model/adapters/sql_adapter'

CONNECTION_URI = "sqlite://#{ __dir__ }/test.db"

database = Sequel.connect(CONNECTION_URI)

database.create_table! :tasks do
  primary_key :id
  String :name
  Integer :user_id
end
#sqlite
#|
#v
#CREATE TABLE 'task' (id INTEGER PRIMARY KEY, name varchar(255));
database = Sequel.connect(CONNECTION_URI)

database.create_table! :users do
  primary_key :id
  String :email
  String :password
end
