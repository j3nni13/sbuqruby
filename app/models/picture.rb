class Picture < ActiveRecord::Base
belongs_to :listing, polymorphic: true
 # paperclip attachments...

 has_attached_file :photo, styles: { 
		medium: '200x200>',
		thumb: '100x100>'
		}, 
		:default_url => "img/missing.jpg" 

	validates_attachment_content_type :photo, 
	content_type:  /^image\/(png|gif|jpeg)/,
	message: "Only images allowed"

# If requires image validation:
# validates :image, attachment_presence: true
end

