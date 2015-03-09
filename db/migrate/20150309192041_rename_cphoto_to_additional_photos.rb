class RenameCphotoToAdditionalPhotos < ActiveRecord::Migration
  def change
    change_table :additional_photos do |t|
        t.rename :cphoto, :avatar
    end
  end
end
