json.array!(@rewards) do |reward|
  json.extract! reward, :id, :name, :cost
  json.url reward_url(reward, format: :json)
end
