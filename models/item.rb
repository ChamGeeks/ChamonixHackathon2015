class Item
   include DataMapper::Resource

   property :id, Serial
   property :type, String
   property :price, Decimal

   belongs_to :bar
end

