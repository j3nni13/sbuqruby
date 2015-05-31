class ListingsReception < ActiveRecord::Base
	belongs_to :listings 
	belongs_to :receptions
end
