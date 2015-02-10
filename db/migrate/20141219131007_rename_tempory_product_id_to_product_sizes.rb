class RenameTemporyProductIdToProductSizes < ActiveRecord::Migration
  def change
   change_table :product_sizes do |t|
      t.rename :temporary_product_id, :connection_id
   end
      add_column :product_sizes, :number, :integer
  end
end
