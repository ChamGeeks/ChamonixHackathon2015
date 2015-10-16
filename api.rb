require 'sinatra'
require 'data_mapper'

Process.fork do
  File.delete('burgers_and_beers.db') if Dir['burgers_and_beers.db'].any?
  exec('sqlite3 burgers_and_beers.db < data_setup.sql')
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/burgers_and_beers.db")

class DayOfWeek
  include DataMapper::Resource

  storage_names[:default] = 'days_of_week'

  property :id, Serial
  property :name, String
end

class Bar
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :latitude, Decimal
  property :longitude, Decimal

end

DataMapper.finalize


get '/' do
  "Bars: #{Bar.all.map{|b| b.name}.join(', ')}<br />"\
  "Days of week: #{DayOfWeek.all.map{|d| d.name}.join(', ')}"
end

