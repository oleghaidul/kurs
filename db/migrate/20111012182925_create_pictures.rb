class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.string :name
      t.string :image_file_name
      t.string :image_content_type
      t.integer :image_file_size
      t.integer :imageable_id
      t.string :imageable_type
      
      t.datetime :image_updated_at
    end
  end

  def self.down
    drop_table :pictures
  end
end
