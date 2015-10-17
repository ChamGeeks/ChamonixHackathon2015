class Bar
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :latitude, Decimal
  property :longitude, Decimal
  property :image_url, String

  has n, :offers

  def locations
    { lat: latitude, long: longitude }
  end
end
