class Listing < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :slugged

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
 	has_many :pictures, :dependent => :destroy
	has_attached_file :image, styles: { 
		medium: '200x200>',
		thumb: '100x100>'
		}, 
		:default_url => "img/missing.png" 

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
    edit do
    	configure :title do
    		label 'Venue Name'
    	end
    	configure :street2 do
    		label "Address Cont."
    	end
    	configure :postalcode do
    		label "Postal Code"
    	end
    	configure :contactname do
    		label "Venue Contact"
    	end
    	configure :contacttitle do
    		label "Contact Title"
    	end
    	configure :phonenumber do
    		label "Phone number"
    	end
      configure :pnotes do
        label "Permission Notes"
      end

    	exclude_fields :eventtype, :venuetype, :parking, :food, :alcohol, :audiovisual, :reception, :image, :amenities
    end	
   end
end
