class CreateProductSizes < ActiveRecord::Migration
  def change
    create_table :product_sizes do |t|
      t.integer :temporary_product_id
      t.integer :size_id
    end
  end
end
