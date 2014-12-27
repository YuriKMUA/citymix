class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.boolean :llatest
      t.integer :neck_id
      t.string  :cedrpou
      t.string  :ctxt
      t.text    :ccontent
      t.float   :nprice
      t.boolean :lvisible
      t.integer :nshtrih_kod
      t.string  :cartikul
      t.boolean :ldelivery
      t.integer :nprice_delivery
      t.integer :kategories_id
      t.integer :ngroup_tovs_id
      t.integer :season_id
      t.integer :manufacturer_id
      t.integer :nvariation_id
      t.integer :suplier_id
      t.integer :npurchase_price
      t.integer :nold_price
      t.string  :cphoto
      t.integer :type_id
      t.integer :brand_id
      t.integer :fastener_id

      t.timestamps
    end
    add_index :products, :cedrpou, unique: true
    add_index :products, :cartikul, unique: true
  end
end
