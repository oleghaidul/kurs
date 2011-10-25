class CreateOptions < ActiveRecord::Migration
  def self.up
    create_table :options do |t|
      t.string :name
      t.integer :car_id
      t.text :description
      t.integer :price

      t.timestamps
    end
  end

  def self.down
    drop_table :options
  end
end
