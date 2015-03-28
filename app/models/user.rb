class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :listings
         has_many :venuetypes, :through => :listings
         has_many :eventtypes, :through => :listings
     end
     def admin?
     	admin
     end


