class DashboardController < ApplicationController
  def index
    @q = City.includes(:crime_rates, :school_grades, :appreciation_values).ransack(params[:q])
    @cities = @q.result(distinct: true)
  end

  def search
  end
end
