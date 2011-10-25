class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars do |t|
      t.string :name
      t.integer :model_id
      t.text :description
      t.integer :year
      t.string :car_type
      t.integer :price
      t.integer :horsepower
      t.integer :seating_capacity
      t.integer :engine
      t.string :fuel_type
      t.integer :towing_capacity
      t.string :body_style
      t.string :transmission
      t.string :drive_type
      t.integer :discount

      t.timestamps
    end
  end

  def self.down
    drop_table :cars
  end
end
