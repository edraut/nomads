class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :name
      t.string :type
      t.text :body
      t.string :partial
      t.integer :position
      t.boolean :dirty, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
