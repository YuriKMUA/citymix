class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :text

      t.timestamps
    end
  end
end
