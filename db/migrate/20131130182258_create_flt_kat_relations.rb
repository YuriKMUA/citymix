class CreateFltKatRelations < ActiveRecord::Migration
  def change
    create_table :flt_kat_relations do |t|

      t.integer :filter_id
      t.integer :kategory_id

      t.timestamps
    end
  end
end
