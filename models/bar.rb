class Bar
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :latitude, Decimal
  property :longitude, Decimal
  property :image_url, String

  has n, :offers
  has n, :items

  def locations
    { lat: latitude, long: longitude }
  end

  def tagged
    offers.all.map {|o| o.tags.split(',') }.flatten.uniq
  end
end
