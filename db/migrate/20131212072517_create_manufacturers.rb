class CreateManufacturers < ActiveRecord::Migration
  def change
    create_table :manufacturers do |t|
      t.string :ctxt
      t.integer :kategories_id

      t.timestamps
    end
  end
end
