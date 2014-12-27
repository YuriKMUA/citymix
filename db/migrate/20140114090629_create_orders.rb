class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :cartikul
      t.string :ctxt
      t.text   :ccontent
      t.integer :size_id
      t.integer :user_id
      t.integer :number
      t.integer :nprice
      t.integer :nsum
      t.integer :color_id
      t.integer :status_id
      t.integer :color_id
      t.integer :discount
      t.string  :promo_kod

      t.timestamps
    end
      add_index :orders, :cartikul
      add_index :orders, :promo_kod
  end
end
