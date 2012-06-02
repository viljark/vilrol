class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :user_id, :null => false
      t.integer :offer_id, :null => false
      t.integer :quantity, :null => false
      t.timestamps
    end
  end
end
