class AddArtikulToConnections < ActiveRecord::Migration
  def change
    add_column :connections, :cartikul, :string
  end
end
