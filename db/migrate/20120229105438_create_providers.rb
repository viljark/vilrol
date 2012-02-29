class CreateProviders < ActiveRecord::Migration
  def change
    create_table :providers do |t|
      t.string :name, :limit => 255, :null => false
      t.string :address, :limit => 255
      t.text :description
      
      t.timestamps
    end
  end
end
