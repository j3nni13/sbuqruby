class Listing < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :venuetypes
	has_and_belongs_to_many :eventtypes
	has_attached_file :image

	validates_attachment_content_type :image, 
	content_type:  /^image\/(png|gif|jpeg)/,
	message: "Only images allowed"

# If requires image validation:
# validates :image, attachment_presence: true

	geocoded_by :location
	after_validation :geocode

end
