namespace :db do
  desc "Autogenerate posts data"
  task :posts => :environment do
    require 'faker'
    
    20.times do |t|
      name = Faker::Lorem.words(5)
      name = name.join(" ")
      
      Post.create!(
        name: name,
        slug: Faker::Internet.slug(name, '-'),
        image: Faker::Avatar.image,
        description: Faker::Lorem.paragraphs,
        content: Faker::Lorem.paragraphs,
      )  
    end
    
    puts "Generate posts data finished!"
  end
end