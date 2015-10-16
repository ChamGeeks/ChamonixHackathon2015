require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/burgers_and_beers.db")

class Bar
  include DataMapper::Resource

  property :id, Serial
  property :name, String
end

DataMapper.finalize


get '/' do
  "Bar count: #{Bar.all.size}"
end

