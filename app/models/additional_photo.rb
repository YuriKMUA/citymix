class AdditionalPhoto < ActiveRecord::Base

   attr_accessible :kod_id, :cphoto, :cartikul

   belongs_to :product
   belongs_to :connection

end
