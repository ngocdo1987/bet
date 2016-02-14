namespace :db do
  desc "Autogenerate tags data"
  task :tags => :environment do
    require 'faker'
    
    Tag.delete_all
    
    10.times do |t|
      name = Faker::Lorem.words(2)
      name = name.join(" ")
      
      Tag.create!(
        name: name,
        slug: Faker::Internet.slug(name, '-')
      ) 
    end
    
    puts "Generate tags data finished!"
  end
end