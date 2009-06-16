class CreateFabrics < ActiveRecord::Migration
  def self.up
    create_table :fabrics do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :fabrics
  end
end
