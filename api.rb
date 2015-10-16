require 'sinatra'
require 'data_mapper'

Process.fork do
  File.delete('burgers_and_beers.db') if Dir['burgers_and_beers.db'].any?
  exec('sqlite3 burgers_and_beers.db < data_setup.sql')
end

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

