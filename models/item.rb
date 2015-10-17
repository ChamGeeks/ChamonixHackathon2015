class Item
   include DataMapper::Resource

   property :id, Serial
   property :type, String
   property :price, Integer

   belongs_to :bar
end

