class AddAvailabilityToProduct < ActiveRecord::Migration
  def change
    add_column :products, :availability, :string
  end
end
