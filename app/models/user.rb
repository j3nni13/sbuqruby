class User < ActiveRecord::Base

  rails_admin do
    configure :set_password

    edit do
      exclude_fields :password, :password_confirmation, :venuetypes, :eventtypes, :reset_password_sent_at, :amenities, :foods, :parkings, :alcohols, :receptions
      include_fields :set_password
    end
  end

  # Provided for Rails Admin to allow the password to be reset
  def set_password; nil; end

  def set_password=(value)
    return nil if value.blank?
    self.password = value
    self.password_confirmation = value
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

    def fullname
    [firstname, lastname].compact.reject(&:blank?).join(' ')
    end
    
# In-App Messaging
         acts_as_messageable

         def mailboxer_name
          self.name
        end
 
        def mailboxer_email(object)
          self.email
        end
        
         has_many :listings
         has_many :venuetypes, :through => :listings
         has_many :eventtypes, :through => :listings
         has_many :amenities, :through => :listings
         has_many :foods, :through => :listings
         has_many :parkings, :through => :listings
         has_many :alcohols, :through => :listings
         has_many :receptions, :through => :listings
         has_many :favourite_listings, through: :favourites, source: :favourited, source_type: "Listing"
         has_many :favourites


         has_attached_file :avatar, styles: {
          thumb: '100x100>',
          square: '200x200#',
          medium: '300x300>'},
          :default_url => "img/missing.png" 
        
end


     

# Set Roles
     def admin?
     	admin
     end

     def venuemanager?
      venuemanager
     end

     private