class Neck < ActiveRecord::Base
   
   attr_accessible :ctxt

   has_many :products
end   
