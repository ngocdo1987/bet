namespace :db do
  desc "Autogenerate categories data"
  task :categories => :environment do
    require 'faker'
    
    Category.delete_all
    
    10.times do |t|
      name = Faker::Lorem.words(2)
      name = name.join(" ")
      
      Category.create!(
        name: name,
        slug: Faker::Internet.slug(name, '-')
      ) 
    end
    
    puts "Generate categories data finished!"
  end
end