class RenamePhotoToProducts < ActiveRecord::Migration
  def change
      change_table :products do |t|
         t.rename :cphoto, :avatar
      end   
  end
end
