class SchoolGradesController < ApplicationController
  def index
    matching_school_grades = SchoolGrade.all

    @list_of_school_grades = matching_school_grades.order({ :created_at => :desc })

    render({ :template => "school_grades/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_school_grades = SchoolGrade.where({ :id => the_id })

    @the_school_grade = matching_school_grades.at(0)

    render({ :template => "school_grades/show" })
  end

  def create
    the_school_grade = SchoolGrade.new
    the_school_grade.city_id = params.fetch("query_city_id")
    the_school_grade.score_compared_to_us = params.fetch("query_score_compared_to_us")
    the_school_grade.score_compared_to_il = params.fetch("query_score_compared_to_il")

    if the_school_grade.valid?
      the_school_grade.save
      redirect_to("/school_grades", { :notice => "School grade created successfully." })
    else
      redirect_to("/school_grades", { :alert => the_school_grade.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_school_grade = SchoolGrade.where({ :id => the_id }).at(0)

    the_school_grade.city_id = params.fetch("query_city_id")
    the_school_grade.score_compared_to_us = params.fetch("query_score_compared_to_us")
    the_school_grade.score_compared_to_il = params.fetch("query_score_compared_to_il")

    if the_school_grade.valid?
      the_school_grade.save
      redirect_to("/school_grades/#{the_school_grade.id}", { :notice => "School grade updated successfully."} )
    else
      redirect_to("/school_grades/#{the_school_grade.id}", { :alert => the_school_grade.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_school_grade = SchoolGrade.where({ :id => the_id }).at(0)

    the_school_grade.destroy

    redirect_to("/school_grades", { :notice => "School grade deleted successfully."} )
  end
end
