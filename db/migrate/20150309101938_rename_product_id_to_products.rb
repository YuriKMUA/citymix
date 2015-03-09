class RenameProductIdToProducts < ActiveRecord::Migration
  def change
    change_table :additional_photos do |t|
        t.rename :kod_id, :product_id
    end
  end
end
