class StatusDelivery < ActiveRecord::Base
   has_many :orders
   has_many :baskets
end
