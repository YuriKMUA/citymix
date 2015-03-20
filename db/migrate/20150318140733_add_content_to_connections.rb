class AddContentToConnections < ActiveRecord::Migration
  def change
    add_column :connections, :content, :text
  end
end
