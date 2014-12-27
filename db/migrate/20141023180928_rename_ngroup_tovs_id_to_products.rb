class RenameNgroupTovsIdToProducts < ActiveRecord::Migration
  def change
      change_table :products do |t|
         t.rename :ngroup_tovs_id, :group_tov_id
      end   
  end
end
