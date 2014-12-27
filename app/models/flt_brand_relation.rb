class FltBrandRelation < ActiveRecord::Base
   
   belongs_to :brand
   belongs_to :filter
end
