class RenameKategoriesIdToProducts < ActiveRecord::Migration
  def change
    change_table :products do |t|
        t.rename :kategories_id, :kategory_id
    end
  end
end
