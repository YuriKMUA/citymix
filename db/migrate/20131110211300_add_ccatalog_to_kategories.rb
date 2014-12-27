class AddCcatalogToKategories < ActiveRecord::Migration
  def change
    add_column :kategories, :ccatalog, :string
  end
end
