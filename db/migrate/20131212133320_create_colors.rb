class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :ctxt

      t.timestamps
    end
  end
end
