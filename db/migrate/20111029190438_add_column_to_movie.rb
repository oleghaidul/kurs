class AddColumnToMovie < ActiveRecord::Migration
  def self.up
    add_column :movies, :comments_count, :integer, :default => 0
  end

  def self.down
    remove_column :movies, :comments_count
  end
end
