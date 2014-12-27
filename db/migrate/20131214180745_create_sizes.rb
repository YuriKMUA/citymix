class CreateSizes < ActiveRecord::Migration
  def change
    create_table :sizes do |t|
      t.string :ctxt

      t.timestamps
    end
  end
end
