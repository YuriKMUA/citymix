class TemporaryProduct < ActiveRecord::Base
   attr_accessible :kod_id, :ctxt, :type_id, :cphoto, :nprice, :nold_price, :cartikul, :kategories_id, :brand_id, :season_id, :manufacturer_id, :neck_id, :fastener_id, :llatest, :created_at, :kategories_id, :ccontent, :cartikul_add
   
   belongs_to :type
   belongs_to :season
   belongs_to :brand
   belongs_to :manufacturer
#   has_many :products_colors
   has_many :connections
   has_many :colors, through: :connections
   belongs_to :neck
   has_many :sizes, through: :connections
   belongs_to :fastener
   has_many :additional_photos, foreign_key: :kod_id  
end
