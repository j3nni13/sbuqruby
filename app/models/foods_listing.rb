class FoodsListing < ActiveRecord::Base
	belongs_to :listings 
	belongs_to :foods
end
