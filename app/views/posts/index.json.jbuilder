json.array!(@posts) do |post|
  json.extract! post, :id, :name, :slug, :image, :description, :content
  json.url post_url(post, format: :json)
end
