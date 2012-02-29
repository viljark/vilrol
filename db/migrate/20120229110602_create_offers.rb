class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.integer :provider_id, :null => false
      t.string :name, :limit => 255, :null => false
      t.text :description
      t.integer :count, :default => 0, :null => false
      t.decimal :price, :scale => 6, :precision => 2
      t.date :end_date
      t.timestamps
    end
  end
end
