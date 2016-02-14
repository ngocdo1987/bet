namespace :db do
  desc "Autogenerate recipes data"
  task :recipes => :environment do
    require 'faker'
    
    chefs = Chef.all
    
    chefs.each do |chef|
      3.times do |t|
        
        Recipe.create!(
          chef_id: chef.id,
          name: Faker::Name.name,
          image: Faker::Avatar.image,
          summary: Faker::Lorem.sentence,
          description: Faker::Lorem.paragraphs,
          ingredients: Faker::Lorem.paragraphs,
          steps: Faker::Lorem.paragraphs,
          cooking_time: Faker::Lorem.word,
          level: Faker::Lorem.word
        )
      end
       
    end
    
    puts "Generate recipes data finished!"
  end
end