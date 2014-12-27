class Basket < ActiveRecord::Base

   mount_uploader :avatar, AvatarUploader
   attr_accessible :user_id, :cartikul, :ctxt, :size_id, :color_id, :number, :nprice, :nsum, :discount, :promo_kod, :avatar, :remember_token, :order_id, :status_delivery_id

   belongs_to :size
   belongs_to :color
   belongs_to :product
   belongs_to :order
   belongs_to :status_delivery
   belongs_to :user
end
