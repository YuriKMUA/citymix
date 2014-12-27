class RenameConditionToProduct < ActiveRecord::Migration
  def change
   change_table :products do |t|
      t.rename :nvariation_id, :condition_id
   end
  end
end
