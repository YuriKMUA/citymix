class RenameIndexToProductsCartikul < ActiveRecord::Migration
  def change
          add_index :products, :cartikul, unique: false
  end
end
