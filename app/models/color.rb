class Color < ActiveRecord::Base
   attr_accessible :ctxt
   
#   has_and_belongs_to_many :temporary_products, join_table: "products_colors"
   has_many :connections
   has_many :products, through: :connections, foreign_key: :kod_id
   has_many :baskets, foreign_key: :kod_id
end
