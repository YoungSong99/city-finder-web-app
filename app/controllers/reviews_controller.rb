class ReviewsController < ApplicationController
  def index
    matching_reviews = Review.all

    @list_of_reviews = matching_reviews.order({ :created_at => :desc })

    render({ :template => "reviews/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_reviews = Review.where({ :id => the_id })

    @the_review = matching_reviews.at(0)

    render({ :template => "reviews/show" })
  end

  def create
    the_review = Review.new
    the_review.user_id = params.fetch("query_user_id")
    the_review.city_id = params.fetch("query_city_id")
    the_review.pros = params.fetch("query_pros")
    the_review.cons = params.fetch("query_cons")
    the_review.recommend_family_type = params.fetch("query_recommend_family_type")
    the_review.ratings = params.fetch("query_ratings")
    the_review.zipcode = params.fetch("query_zipcode")

    if the_review.valid?
      the_review.save
      redirect_to("/reviews", { :notice => "Review created successfully." })
    else
      redirect_to("/reviews", { :alert => the_review.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_review = Review.where({ :id => the_id }).at(0)

    the_review.user_id = params.fetch("query_user_id")
    the_review.city_id = params.fetch("query_city_id")
    the_review.pros = params.fetch("query_pros")
    the_review.cons = params.fetch("query_cons")
    the_review.recommend_family_type = params.fetch("query_recommend_family_type")
    the_review.ratings = params.fetch("query_ratings")
    the_review.zipcode = params.fetch("query_zipcode")

    if the_review.valid?
      the_review.save
      redirect_to("/reviews/#{the_review.id}", { :notice => "Review updated successfully."} )
    else
      redirect_to("/reviews/#{the_review.id}", { :alert => the_review.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_review = Review.where({ :id => the_id }).at(0)

    the_review.destroy

    redirect_to("/reviews", { :notice => "Review deleted successfully."} )
  end
end
