class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.string :name
      t.text :body
      t.integer :reviewable_id
      t.string :reviewable_type
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
