require 'sinatra'
require 'data_mapper'

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

  def day
    day_of_week.name
  end

  def ends
    "#{ends_at/60}:#{ends_at_minute}"
  end

  def starts
    "#{starts_at/60}:#{starts_at_minute}"
  end

  def tagged
    tags.split(',')
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

  def locations
    { lat: latitude, long: longitude }
  end
end

DataMapper.finalize


get '/' do
  "Bars: #{Bar.all.map{|b| "#{b.name} (#{b.offers.count} offers)"}.join(', ')}<br />"\
  "Days of week: #{DayOfWeek.all.map{|d| d.name}.join(', ')}"
end

get '/bars/:id' do
  content_type :json

  @bar = Bar.all(id: params[:id])
  @bar.to_json(
    only: [:id, :name], 
    methods: [:location],
    relationships: { 
      offers: {
        only: [:id, :type],
        methods: [:day, :starts, :ends, :tagged]
      }
    })
end

get '/offers' do
  content_type :json

  @offers = Offer.all
  @offers.to_json(
    only: [:id, :type],
    methods: [:day, :starts, :ends, :tagged],
    relationships: {
      bar: {
        only: [:id, :name, :location]
      }
    }
  )
end

get '/days/:day' do
  content_type :json

  @day = DayOfWeek.all(name: params[:day])
  @day.to_json(
    only: [:name],
    relationships: {
      offers: {
        only: [:id, :type],
        methods: [:day, :starts, :ends, :tagged],
        relationships: {
          bar: {
            only: [:id, :name, :location]
          }
        }
      }
    }
  )
end

