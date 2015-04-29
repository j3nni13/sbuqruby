class ListingsParking < ActiveRecord::Base
	belongs_to :listings 
	belongs_to :parkings 
end
