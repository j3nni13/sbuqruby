class Listing < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :venuetypes
	has_and_belongs_to_many :eventtypes
	has_attached_file :image
end
