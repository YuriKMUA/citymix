class CreateGroupTovs < ActiveRecord::Migration
  def change
    create_table :group_tovs do |t|
      t.string :ctxt
      t.boolean :lvisible

      t.timestamps
    end
  end
end
