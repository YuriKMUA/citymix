class RenameConnectionIdToAdditionalPhotos < ActiveRecord::Migration
  def change
    change_table :additional_photos do |t|
        t.rename :product_id, :connection_id
    end    
  end
end
