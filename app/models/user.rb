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
          medium: '300x300>',
          large: '600x600>'},
          :default_url => "img/missing.png",
          :processors => [:cropper] 
  
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/]
  validates_with AttachmentSizeValidator, :attributes => :avatar, :less_than => 2.megabytes
  
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :reprocess_avatar, :if => :cropping?
 
  def cropping?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end
 
  def avatar_geometry(style = :original)
    @geometry ||= {}
    @geometry[style] ||= Paperclip::Geometry.from_file(avatar.url(style))
end
      
  skip_callback :save, :after, :store_file! 


end


     

# Set Roles
     def admin?
     	admin
     end

     def venuemanager?
      venuemanager
     end

     private

     def reprocess_avatar
  avatar.assign(avatar)
  avatar.save
end