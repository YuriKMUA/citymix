class AddCpochtaToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cpochta, :string
  end
end
