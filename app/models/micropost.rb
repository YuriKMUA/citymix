# == Schema Information
#
# Table name: microposts
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  user_id    :integer
#  group_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Micropost < ActiveRecord::Base
  
  attr_accessible :content
  belongs_to :user
  belongs_to :group

  validates :user_id, presence: true
#  validates :group_id, presence: true
  validates :content, length: { minimum: 10, maximum: 250 }
  
#  default_scope order: 'microposts.created_at DESC'
  
  def self.from_users_followed_by(user)
     followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
     where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)		
  end
	
end
