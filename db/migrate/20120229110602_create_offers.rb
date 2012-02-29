class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.string :name, :limit => 255, :null => false
      t.text :description
      t.integer :count
      t.decimal :price, :scale => 6, :precision => 2
      t.date :enddate 
      t.timestamps
    end
  end
end
