class RenameFieldsToOrders < ActiveRecord::Migration
  def change
    change_table :orders do |t|
        t.rename :status_id, :status_delivery_id
        t.rename :discount, :oplata
        t.rename :promo_kod, :dostavka
        t.remove :size_id
    end
    add_column :orders, :declaration_id, :string
  end
end
