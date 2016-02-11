json.array!(@chefs) do |chef|
  json.extract! chef, :id, :chefname, :image, :position, :description, :email, :facebook, :twitter, :linkedin, :gplus
  json.url chef_url(chef, format: :json)
end
