json.array!(@users) do |user|
  json.extract! user, :id, :name, :phone, :address
  json.url user_url(user, format: :json)
end
