class Brand < ActiveRecord::Base
  attr_accessible :ctxt, :country

  validates :ctxt, presence: true
  has_many :products
end
