class AddCityPhoneToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_column :users, :phone, :string
  end
end
