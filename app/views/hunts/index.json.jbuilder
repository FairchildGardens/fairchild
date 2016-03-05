json.array!(@hunts) do |hunt|
  json.extract! hunt, :id, :name, :image, :description
  json.url hunt_url(hunt, format: :json)
end
