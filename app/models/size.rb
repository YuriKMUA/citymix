class Size < ActiveRecord::Base
   attr_accessible :ctxt, :kategories_id
   
#   has_and_belongs_to_many :temporary_products, join_table: "products_sizes"
   has_many :connectionsizes
   has_many :connections, through: :connectionsizes
#   has_many :products, through: :connections
   has_many :baskets, foreign_key: :kod_id
end
