class RenameKategoriesIdToSizes < ActiveRecord::Migration
  def change
    change_table :sizes do |t|
        t.rename :kategories_id, :group_tov_id
    end
  end
end
