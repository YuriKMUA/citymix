class Connectionsize < ActiveRecord::Base

   attr_accessible :number, :connection_id, :size_id

   belongs_to :connection
   belongs_to :size
   
   validates :size_id, :connection_id, presence: true
end
