class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :ctxt

      t.timestamps
    end
  end
end
