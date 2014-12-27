class Kategory < ActiveRecord::Base
   
   mount_uploader :avatar, AvatarUploader
   attr_accessible :ctxt_ua, :ctxt_rus, :avatar, :lvisible, :ccatalog, :group_tov_id

   validates :ctxt_ua, :group_tov_id, :avatar, presence: true


   has_many :products 
   has_many :group_tovs
   has_many :flt_kat_relations
   has_many :filters, through: :flt_kat_relations
end
