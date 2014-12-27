class CreateNecks < ActiveRecord::Migration
  def change
    create_table :necks do |t|
      t.string :ctxt

      t.timestamps
    end
  end
end
