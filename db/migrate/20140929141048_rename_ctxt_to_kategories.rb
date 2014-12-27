class RenameCtxtToKategories < ActiveRecord::Migration
  def change
   change_table :kategories do |t|
      t.string  :ctxt_rus
      t.rename :ctxt, :ctxt_ua
   end   
  end
end
