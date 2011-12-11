namespace :avatars do
  desc "Create initial avatar database."
  task :init => :environment do
    Dir.chdir("#{RAILS_ROOT}/public/avatars/")
    @image_paths = Dir["*.jpg"]
    for avatar in @image_paths
      path = "#{RAILS_ROOT}/public/avatars/#{avatar}"
      fsize = File.size(path)
      avatar = Picture.create(:image_file_name => avatar, :image_content_type => 'image/jpeg', :image_file_size => fsize)
      avatar.save
    end
  end
end