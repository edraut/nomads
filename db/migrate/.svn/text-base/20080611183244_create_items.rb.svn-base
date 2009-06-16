class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :name
      t.text :description
      t.integer :brand_id
      t.integer :price
      t.boolean :home_page_feature
      t.integer :sale_price
      t.boolean :on_sale
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
