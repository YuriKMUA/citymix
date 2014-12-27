class RenameTemporyProductIdToProductSizes < ActiveRecord::Migration
  def change
   change_table :products_sizes do |t|
      t.rename :temporary_product_id, :connection_id
   end
      add_column :products_sizes, :number, :integer
  end
end
