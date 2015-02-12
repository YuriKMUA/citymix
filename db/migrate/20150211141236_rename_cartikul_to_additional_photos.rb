class RenameCartikulToAdditionalPhotos < ActiveRecord::Migration
  def change
       add_column :additional_photos, :kod_id, :integer    
  end
end
