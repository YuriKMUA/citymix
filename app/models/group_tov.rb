class GroupTov < ActiveRecord::Base

   attr_accessible :ctxt, :lvisible

   has_many :products
   belongs_to :kategory

   has_many :flt_kat_relations
   has_many :filters, through: :flt_kat_relations

   
   validates :ctxt, presence: true
end
