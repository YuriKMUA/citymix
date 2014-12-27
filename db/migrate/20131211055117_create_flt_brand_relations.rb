class CreateFltBrandRelations < ActiveRecord::Migration
  def change
    create_table :flt_brand_relations do |t|
      t.string :ctxt
      t.integer :brands_id

      t.timestamps
    end
  end
end
