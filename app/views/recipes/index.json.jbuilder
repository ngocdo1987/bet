json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :chef_id, :name, :image, :summary, :description, :ingredients, :steps, :cooking_time, :level
  json.url recipe_url(recipe, format: :json)
end
