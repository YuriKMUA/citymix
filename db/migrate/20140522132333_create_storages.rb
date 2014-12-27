class CreateStorages < ActiveRecord::Migration
  def change
    create_table :storages do |t|
      t.string :cartikul
      t.integer :number
      t.string :ctxt
      t.string :cartikul_add

      t.timestamps
    end
  end
end
