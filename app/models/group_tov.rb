class GroupTov < ActiveRecord::Base

   attr_accessible :ctxt, :lvisible

   has_many :products
   belongs_to :kategory
   
   validates :ctxt, presence: true
end
