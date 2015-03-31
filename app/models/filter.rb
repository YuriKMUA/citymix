class Filter < ActiveRecord::Base
   has_many :flt_kat_relations
#   has_many :kategories, through: :flt_kat_relations
    has_many :group_tovs, through: :flt_kat_relations
end
