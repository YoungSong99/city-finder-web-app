namespace :geocode do
  desc "Geocode all cities"
  task cities: :environment do
    City.find_each do |city|
      city.geocode
      city.save
    end
  end
end