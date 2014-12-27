class Connection < ActiveRecord::Base

   mount_uploader :avatar, AvatarUploader
   attr_accessible :avatar, :number, :cartikul, :size_id, :color_id 

   belongs_to :product
   belongs_to :color
   has_many   :additional_photos, foreign_key: :kod_id
   has_many   :connectionsizes
   has_many   :sizes, through: :connectionsizes
 
   validates :color_id, :product_id, :avatar, presence: true 

end
