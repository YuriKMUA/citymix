class CreateAdditionalPhotos < ActiveRecord::Migration
  def change
    create_table :additional_photos do |t|
      t.string :cartikul
      t.string :cphoto

      t.timestamps
    end
  end
end
