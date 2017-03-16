class PropertyImage < ActiveRecord::Base
   mount_uploader :image, AvatarUploader
   belongs_to :property
end
