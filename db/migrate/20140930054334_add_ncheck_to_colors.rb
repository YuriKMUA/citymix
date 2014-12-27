class AddNcheckToColors < ActiveRecord::Migration
  def change
    add_column :colors, :ncheck, :integer
  end
end
