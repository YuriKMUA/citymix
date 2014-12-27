class Brand < ActiveRecord::Base
  attr_accessible :ctxt, :kategories_id

  validates :ctxt, :kategories_id, presence: true
  has_many :products
end
