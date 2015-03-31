class RenameFltKatRelationToKategoryId < ActiveRecord::Migration
  def change
    change_table :flt_kat_relations do |t|
        t.rename :kategory_id, :group_tov_id
    end
  end
end
