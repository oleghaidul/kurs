class CreateNews < ActiveRecord::Migration
  def self.up
    create_table :news do |t|
      t.string :name
      t.text :body
      t.string :photo
      t.string :news_type
      t.integer :user_id
      t.boolean :archived, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :news
  end
end
