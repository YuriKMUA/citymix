class Order < ActiveRecord::Base
   attr_accessible :ctxt, :ccontent, :nsum, :dostavka, :oplata, :user_id, :status_delivery_id, :declaration_id

   belongs_to :user
   has_many :baskets
   belongs_to :status_delivery
end
