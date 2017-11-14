json.array!(@babysitters) do |babysitter|
  json.extract! babysitter, :id, :first_name, :last_name, :city, :phone_number, :rate, :sat_score
  json.url babysitter_url(babysitter, format: :json)
end
