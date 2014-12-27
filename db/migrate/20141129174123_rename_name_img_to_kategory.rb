class RenameNameImgToKategory < ActiveRecord::Migration
  def change
      change_table :kategories do |t|
         t.rename :name_img, :avatar
      end   
  end
end
