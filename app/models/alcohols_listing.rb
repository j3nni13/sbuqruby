class AlcoholsListing < ActiveRecord::Base
		belongs_to :listings 
		belongs_to :alcohols 
end
