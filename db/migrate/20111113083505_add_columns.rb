class AddColumns < ActiveRecord::Migration
  def self.up
  	add_column :cars, :comments_count, :integer, :default => 0
  	add_column :manufacturers, :comments_count, :integer, :default => 0
  end

  def self.down
  	remove_column :cars, :comments_count
  	remove_column :manufacturers, :comments_count
  end
end
