class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :edrpou
      t.string :adress
      t.string :menedger
      t.string :password
      t.string :password_confirmation
      t.string :password_digest
      t.string :email

      t.timestamps
    end
  end
end
