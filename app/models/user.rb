class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :listings
         has_many :venuetypes, :through => :listings
         has_many :eventtypes, :through => :listings
         has_many :amenities, :through => :listings
         has_many :foods, :through => :listings
         has_many :parkings, :through => :listings
         has_many :alcohols, :through => :listings
         has_many :receptions, :through => :listings

         has_attached_file :avatar, styles: {
          thumb: '100x100>',
          square: '200x200#',
          medium: '300x300>'
  }

  # Validate the attached image is image/jpg, image/png, etc
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
     end
     def admin?
     	admin
     end



