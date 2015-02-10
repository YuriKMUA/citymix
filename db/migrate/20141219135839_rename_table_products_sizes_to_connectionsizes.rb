class RenameTableProductsSizesToConnectionsizes < ActiveRecord::Migration
  def change
      rename_table :product_sizes, :connectionsizes
  end
end
