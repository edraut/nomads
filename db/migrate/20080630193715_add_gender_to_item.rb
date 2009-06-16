class AddGenderToItem < ActiveRecord::Migration
  def self.up
    add_column :items, :gender, :string
  end

  def self.down
    remove_column :items, :gender
  end
end
