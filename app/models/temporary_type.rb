class TemporaryType < ActiveRecord::Base
   attr_accessible :id, :ctxt, :kategories_id

   belongs_to :product, foreign_key: "kod_id"
end
