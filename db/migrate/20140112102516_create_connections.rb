class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.integer :product_id
      t.integer :color_id
      t.integer :size_id
      t.integer :number
      t.string  :cphoto

      t.timestamps
    end
  end
end
