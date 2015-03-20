class AdditionalPhoto < ActiveRecord::Base

   mount_uploader :avatar, AvatarUploader

   attr_accessible :product_id, :avatar, :cartikul

   belongs_to :product
   belongs_to :connection
  
   validates :avatar, presence: true
   validates :connection_id, presence: true
end
