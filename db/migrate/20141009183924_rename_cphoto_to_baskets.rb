class RenameCphotoToBaskets < ActiveRecord::Migration
  def change
      change_table :baskets do |t|
         t.rename  :cphoto, :avatar
      end   
  end
end
