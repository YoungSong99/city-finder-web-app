module City::Ransackable
  extend ActiveSupport::Concern

  class_methods do
    def ransackable_associations(auth_object = nil)
      %w(appreciation_values crime_rates school_grades language_cities gym_cities prices metras grocery_cities)
    end

    def ransackable_attributes(auth_object = nil)
      %w(city_name latitude longitude state)
    end
  end
end