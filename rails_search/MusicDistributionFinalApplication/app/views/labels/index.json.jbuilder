json.array!(@labels) do |label|
  json.extract! label, :id, :name, :location
  json.url label_url(label, format: :json)
end
