class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :limit => 255, :null => false
      t.string :first_name
      t.string :last_name
      t.timestamps
      t.boolean :is_provider, :default => false
    end
  end
end
