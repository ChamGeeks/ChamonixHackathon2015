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
