class DayOfWeek
  include DataMapper::Resource

  storage_names[:default] = 'days_of_week'

  property :id, Serial
  property :name, String

  has n, :offers
end
