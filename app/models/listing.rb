class Listing < ActiveRecord::Base

	belongs_to :user
	has_and_belongs_to_many :venuetypes
	has_and_belongs_to_many :eventtypes
	has_and_belongs_to_many :parkings
	has_and_belongs_to_many :amenities
	has_and_belongs_to_many :foods
	has_and_belongs_to_many :alcohols
	has_and_belongs_to_many :receptions
	has_many :favourites, as: :favourited
  	has_many :fans, through: :favourites, source: :user

	# Paperclip
	has_attached_file :image, styles: { 
		medium: '200x200>',
		thumb: '100x100>'
		}, :default_url => "img/missing.png"                                                

	validates_attachment_content_type :image, 
	content_type:  /^image\/(png|gif|jpeg)/,
	message: "Only images allowed"

# If requires image validation:
# validates :image, attachment_presence: true

	def address
  [street, street2, city, province, country].compact.reject(&:blank?).join(', ')
	end

# Gmaps

	geocoded_by :address
	after_validation :geocode

# Searching
	 def index
    @search = Listing.search(params[:q])
    @listings = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 40) if params[:q]
end
   
   rails_admin do
    list do
      exclude_fields :eventtype, :venuetype, :amenity
    end
   end
end
