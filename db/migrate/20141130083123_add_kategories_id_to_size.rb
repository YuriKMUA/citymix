class AddKategoriesIdToSize < ActiveRecord::Migration
  def change
    add_column :sizes, :kategories_id, :integer
  end
end
