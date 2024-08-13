class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_city
  before_action :set_review, only: [:edit, :update, :destroy, :show]

  def index
    @reviews = @city.reviews
  end

  def show
  end

  def new
    @review = @city.reviews.new
  end

  def create
    @review = @city.reviews.new(review_params)
    @review.user = current_user

    if @review.save
      redirect_to city_reviews_path(@city), notice: 'Review was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to city_review_path(@review.city, @review), notice: 'Review was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to city_reviews_path(@review.city), notice: 'Review was successfully destroyed.'
  end

  private

  def review_params
    params.require(:review).permit(:pros, :cons, :ratings, { recommend_family_type: [] }, :zipcode)
  end

  helper_method :display_stars

  def set_city
    @city = City.find(params[:city_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def display_stars(review)
    filled_star_icon = '<span class="fa fa-star checked"></span>'
    empty_star_icon = '<span class="fa fa-star"></span>'
    stars = filled_star_icon * review.ratings + empty_star_icon * (5-review.ratings)
    stars.html_safe
  end
end
