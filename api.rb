require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/burgers_and_beers.db")

require "#{Dir.pwd}/models/day_of_week.rb"
require "#{Dir.pwd}/models/offer.rb"
require "#{Dir.pwd}/models/item.rb"
require "#{Dir.pwd}/models/bar.rb"

DataMapper.finalize

before do
  response['Access-Control-Allow-Origin'] = '*'
end

get '/' do
  "Welcome to the Chamonix Hackathon 2015 API!i <br />"\
    "From here, you can browse the API:<br />"\
  "Bars: #{Bar.all.map{|b| "#{b.name} (#{b.offers.count} offers)"}.join(', ')}<br />"\
  "Days of week: #{DayOfWeek.all.map{|d| d.name}.join(', ')}"
end

get '/bars' do
  content_type :json, 'charset' => 'utf-8'

  @bars = Bar.all
  @bars.to_json(
    only: [:id, :name, :image_url], 
    methods: [:location, :tagged]
  )
end

get '/bars/:id' do
  content_type :json, 'charset' => 'utf-8'

  @bar = Bar.all(id: params[:id])
  @bar.to_json(
    only: [:id, :image_url, :name], 
    methods: [:location, :tagged],
    relationships: { 
      ordered_offers: {
        only: [:id, :type],
        methods: [:day, :starts, :ends, :tagged]
      }
    })
end

get '/bars/:id/menu' do
  content_type :json, 'charset' => 'utf-8'

  @items = Item.all(bar_id: params[:id])
  @items.to_json(
    only: [:id, :type, :price]
  )
end

get '/offers' do
  content_type :json, 'charset' => 'utf-8'

  @offers = Offer.all(order: [:day_of_week_id, :starts_at])
  @offers.to_json(
    only: [:id, :type, :extra_info],
    methods: [:day, :starts, :ends, :tagged],
    relationships: {
      bar: {
        only: [:id, :name, :location]
      }
    }
  )
end

get '/days/:day' do
  content_type :json, 'charset' => 'utf-8'

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

