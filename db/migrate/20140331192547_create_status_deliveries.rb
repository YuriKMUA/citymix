class CreateStatusDeliveries < ActiveRecord::Migration
  def change
    create_table :status_deliveries do |t|
      t.string :ctxt

      t.timestamps
    end
  end
end
