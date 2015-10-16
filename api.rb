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

  has n, :offers
end

class Offer
  include DataMapper::Resource

  property :id, Serial
  property :starts_at, Integer
  property :ends_at, Integer
  property :tags, String
  property :type, String

  belongs_to :day_of_week
  belongs_to :bar

  def to_json(_)
    {
      id: id,
      bar: bar,
      starts_at: "#{starts_at/60}:#{starts_at_minute}",
      ends_at: "#{ends_at/60}:#{ends_at_minute}",
      tags: tags.split(','),
      type: type,
      day_of_week: day_of_week
    }
  end

  private

  def starts_at_minute
    @starts_at_minute ||= format('%02d', (starts_at%60))
  end

  def ends_at_minute 
    @ends_at_minute ||= format('%02d', (ends_at%60))
  end
end

class Bar
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :latitude, Decimal
  property :longitude, Decimal

  has n, :offers
end

DataMapper.finalize


get '/' do
  "Bars: #{Bar.all.map{|b| "#{b.name} (#{b.offers.count} offers)"}.join(', ')}<br />"\
  "Days of week: #{DayOfWeek.all.map{|d| d.name}.join(', ')}"
end

get '/bars' do

end

get '/offers' do
  content_type :json

  @offers = Offer.all
  @offers.to_json
end

get '/days/:day' do
  content_type :json
  @day = DayOfWeek.all(name: params[:day])
  @day.to_json
end

