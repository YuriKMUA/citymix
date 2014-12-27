class CreateFasteners < ActiveRecord::Migration
  def change
    create_table :fasteners do |t|
      t.string :ctxt

      t.timestamps
    end
  end
end
