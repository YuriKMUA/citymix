class RenameCphotoToConnection < ActiveRecord::Migration
  def change
      change_table :connections do |t|
         t.rename :cphoto, :avatar
      end
  end
end
