class RenameTableProductsSizesToConnectionsizes < ActiveRecord::Migration
  def change
      rename_table :products_sizes, :connectionsizes
  end
end
