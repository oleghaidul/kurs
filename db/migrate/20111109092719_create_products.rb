class CreateProducts < ActiveRecord::Migration
  def self.up
    create_table :products do |t|
      t.string :name
      t.integer :category_id
      t.string :assignment
      t.string :design
      t.string :construction
      t.integer :price
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :products
  end
end
