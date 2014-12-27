# == Schema Information
#
# Table name: groups

  #
#  id         :integer          not null, primary key
#  text       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Group < ActiveRecord::Base
  attr_accessible :text
  has_many :microposts

  validates :text, presence: true
end
