class Product < ActiveRecord::Base
   
   mount_uploader :avatar, AvatarUploader
   attr_accessible :ctxt, :type_id, :avatar, :nprice, :nold_price, :cartikul, :kategories_id, :brand_id, :season_id, :manufacturer_id, :neck_id, :fastener_id, :llatest, :created_at, :group_tov_id, :ccontent, :condition_id, :availability, :npurchase_price

   default_scope { where(lvisible: true) }
   
   belongs_to :type
   belongs_to :season
   belongs_to :brand
   belongs_to :manufacturer
   has_many   :connections
   has_many   :colors, through: :connections
   belongs_to :neck
   has_many   :sizes, through: :connections
   belongs_to :fastener
   has_many   :additional_photos  
   has_many   :baskets
   belongs_to :group_tov
   belongs_to :condition
   belongs_to :kategory

   validates :brand_id, presence: true
   validates :kategories_id, presence: true
   validates :ctxt,          presence: true
   validates :cartikul,      presence: true
   validates :group_tov_id,  presence: true

   
end
