class AddGroupTovToKategory < ActiveRecord::Migration
  def change
    add_column :kategories, :ngroup_tovs_id, :integer
  end
end
