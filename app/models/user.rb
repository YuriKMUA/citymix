#encoding: utf-8
# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  edrpou          :string(255)
#  adress          :string(255)
#  menedger        :string(255)
#  password_digest :string(255)
#  email           :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  remember_token  :string(255)
#  admin           :boolean          default(FALSE)
#

class User < ActiveRecord::Base
    attr_accessible :name, :city, :last_name, :email, :phone, :password, :password_confirmation, :adress 
#    attr_protected :admin, :as => :admin
    has_secure_password
    has_many :microposts, dependent: :destroy 
    has_many :relationships, foreign_key: "follower_id", dependent: :destroy
    has_many :followed_users, through: :relationships, source: :followed
    has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
    has_many :followers, through: :reverse_relationships, source: :follower
    has_many :orders, dependent: :destroy
    has_many :baskets, dependent: :destroy

    before_save { |user| user.email = email.downcase }
    before_save :create_remember_token

    validates :name, presence: true, length: { maximum: 50, message: "Имя не должно быть больше 50 символов" } 
    validates :last_name, presence: true, length: { maximum: 50, message: "Фамилия не должна быть больше 50 символов" }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    VALID_PHONE_REGEX = /\A[+]\d+\z/
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :phone, presence: true, length: { minimum: 10, message: " - минимальная длина меньше 10 символов" }, format: { with: VALID_PHONE_REGEX }
    validates :city, presence: true
    validates :password, presence: true, length: { minimum: 6, message: "должен быть не меньше 6 символов" }
    validates :password_confirmation,  presence: true



   def feed
      Micropost.from_users_followed_by(self)
   end
   
   def following?(other_user)
      relationships.find_by_followed_id(other_user.id)   
   end
   
   def follow!(other_user)
      relationships.create!(followed_id: other_user.id)
   end
   
   def unfollow!(other_user)
      relationships.find_by_followed_id(other_user.id).destroy   
   end
   

   private

      def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
      end
   
end

