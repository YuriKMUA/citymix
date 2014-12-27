class AddLvisibleToKategories < ActiveRecord::Migration
  def change
    add_column :kategories, :lvisible, :boolean
  end
end
