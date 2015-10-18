class Bar
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :latitude, Decimal, precision: 9, scale: 7
  property :longitude, Decimal, precision: 9, scale: 7
  property :image_url, String

  has n, :offers
  has n, :items

  def ordered_offers
    offers.all(order: [:day_of_week_id, :starts_at])
  end

  def location
    { 
       lat: format("%.7f", latitude), 
       long: format("%.7f", longitude) 
    }
  end

  def tagged
    offers.all.map {|o| o.tags.split(',') }.flatten.uniq
  end
end
