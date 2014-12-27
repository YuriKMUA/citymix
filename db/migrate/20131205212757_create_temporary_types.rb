class CreateTemporaryTypes < ActiveRecord::Migration
  def change
    create_table :temporary_types do |t|
      t.string :ctxt
      t.integer :kategories_id

      t.timestamps
    end
  end
end
