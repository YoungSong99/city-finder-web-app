class ComparisonController < ApplicationController
  def index
    @cities = current_user.favorite_cities
  end
end
