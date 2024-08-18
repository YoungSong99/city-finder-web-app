class MetaTagService
  def self.defaults
    {
      site: "CityFinder::Find Your Perfect City",
      image: ActionController::Base.helpers.asset_path('city_thumbnail.jpg'),
      description: "Discover your top 5 cities with just two quick questions. Ready to see how they stack up? Compare them all in a dynamic graph!",
      og: {
        title: "CityFinder::Find Your Perfect City",
        image: ActionController::Base.helpers.asset_path('city_thumbnail.jpeg'),
        description: "Discover your top 5 cities with just two quick questions. Ready to see how they stack up? Compare them all in a dynamic graph!",
        site_name: "CityFinder"
      }
    }
  end
end
