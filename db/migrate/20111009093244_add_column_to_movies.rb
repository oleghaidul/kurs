class AddColumnToMovies < ActiveRecord::Migration
  def self.up
    add_column :movies, :rate, :integer
    add_column :movies, :status, :string
  end

  def self.down
    remove_column :movies, :status
    remove_column :movies, :rate
  end
end
