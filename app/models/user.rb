class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :listings
         has_many :venuetypes, :through => :listings
         has_many :eventtypes, :through => :listings
         has_many :amenities, :through => :listings
         has_many :foods, :through => :listings
         has_many :parkings, :through => :listings
         has_many :alcohols, :through => :listings
         has_many :receptions, :through => :listings
     end
     def admin?
     	admin
     end



