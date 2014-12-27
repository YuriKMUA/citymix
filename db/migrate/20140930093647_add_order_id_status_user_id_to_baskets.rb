class AddOrderIdStatusUserIdToBaskets < ActiveRecord::Migration
  def change
    add_column :baskets, :order_id, :integer
    add_column :baskets, :status_delivery_id, :integer
    add_column :baskets, :user_id, :integer
    add_column :baskets, :cphoto, :string
  end
end
