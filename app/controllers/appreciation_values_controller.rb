class AppreciationValuesController < ApplicationController
  def index
    matching_appreciation_values = AppreciationValue.all

    @list_of_appreciation_values = matching_appreciation_values.order({ :created_at => :desc })

    render({ :template => "appreciation_values/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_appreciation_values = AppreciationValue.where({ :id => the_id })

    @the_appreciation_value = matching_appreciation_values.at(0)

    render({ :template => "appreciation_values/show" })
  end

  def create
    the_appreciation_value = AppreciationValue.new
    the_appreciation_value.latest_quater = params.fetch("query_latest_quater")
    the_appreciation_value.last_12months = params.fetch("query_last_12months")
    the_appreciation_value.last_2years = params.fetch("query_last_2years")
    the_appreciation_value.last_5years = params.fetch("query_last_5years")
    the_appreciation_value.last_10years = params.fetch("query_last_10years")
    the_appreciation_value.since_2000 = params.fetch("query_since_2000")
    the_appreciation_value.city_id = params.fetch("query_city_id")

    if the_appreciation_value.valid?
      the_appreciation_value.save
      redirect_to("/appreciation_values", { :notice => "Appreciation value created successfully." })
    else
      redirect_to("/appreciation_values", { :alert => the_appreciation_value.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_appreciation_value = AppreciationValue.where({ :id => the_id }).at(0)

    the_appreciation_value.latest_quater = params.fetch("query_latest_quater")
    the_appreciation_value.last_12months = params.fetch("query_last_12months")
    the_appreciation_value.last_2years = params.fetch("query_last_2years")
    the_appreciation_value.last_5years = params.fetch("query_last_5years")
    the_appreciation_value.last_10years = params.fetch("query_last_10years")
    the_appreciation_value.since_2000 = params.fetch("query_since_2000")
    the_appreciation_value.city_id = params.fetch("query_city_id")

    if the_appreciation_value.valid?
      the_appreciation_value.save
      redirect_to("/appreciation_values/#{the_appreciation_value.id}", { :notice => "Appreciation value updated successfully."} )
    else
      redirect_to("/appreciation_values/#{the_appreciation_value.id}", { :alert => the_appreciation_value.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_appreciation_value = AppreciationValue.where({ :id => the_id }).at(0)

    the_appreciation_value.destroy

    redirect_to("/appreciation_values", { :notice => "Appreciation value deleted successfully."} )
  end
end
