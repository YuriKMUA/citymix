class CreateKategories < ActiveRecord::Migration
  def change
    create_table :kategories do |t|
      t.string :ctxt
      t.string :name_img

      t.timestamps
    end
  end
end
