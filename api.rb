require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/burgers_and_beers.db")

require "#{Dir.pwd}/models/day_of_week.rb"
require "#{Dir.pwd}/models/offer.rb"
require "#{Dir.pwd}/models/bar.rb"

DataMapper.finalize


get '/' do
  "Welcome to the Chamonix Hackathon 2015 API!i <br />"\
    "From here, you can browse the API:<br />"\
  "Bars: #{Bar.all.map{|b| "#{b.name} (#{b.offers.count} offers)"}.join(', ')}<br />"\
  "Days of week: #{DayOfWeek.all.map{|d| d.name}.join(', ')}"
end

get '/bars' do
  @bars = Bar.all
  @bars.to_json(
    only: [:id, :name], methods: [:location]
  )
end

get '/bars/:id' do
  content_type :json

  @bar = Bar.all(id: params[:id])
  @bar.to_json(
    only: [:id, :name], 
    methods: [:location],
    relationships: { 
      offers: {
        only: [:id, :image_url, :type],
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

