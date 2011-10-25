class CreateMovies < ActiveRecord::Migration
  def self.up
    create_table :movies do |t|
      t.string :name
      t.string :photo
      t.text :description
      t.string :genre
      t.integer :year
      t.integer :time
      t.timestamp :release_date
      t.string :distributors

      t.timestamps
    end
  end

  def self.down
    drop_table :movies
  end
end
