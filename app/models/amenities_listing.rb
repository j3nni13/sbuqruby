class AmenitiesListing < ActiveRecord::Base
		belongs_to :listings 
		belongs_to :amenities 

end
