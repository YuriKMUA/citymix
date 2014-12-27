class CreateBaskets < ActiveRecord::Migration
  def change
    create_table :baskets do |t|
      t.string :cartikul
      t.string :ctxt
      t.text :ccontent
      t.integer :size_id
      t.string :remember_token
      t.integer :number
      t.integer :nprice
      t.integer :nsum
      t.integer :color_id
      t.integer :discount
      t.string :promo_kod

      t.timestamps
    end
  end
end
