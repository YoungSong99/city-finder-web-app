json.array!(@cities) do |city|
  json.latitude city.latitude
  json.longitude city.longitude
  json.label city.city_name
  json.tooltip render(partial: 'tooltip', locals: { city: city })
end