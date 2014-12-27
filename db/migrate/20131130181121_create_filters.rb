class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|

    t.string :ctxt
    t.boolean :lvisible

      t.timestamps
    end
  end
end
