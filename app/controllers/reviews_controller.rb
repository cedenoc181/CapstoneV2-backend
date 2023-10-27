class ReviewsController < ApplicationController
    skip_before_action :authorized, only: [:create, :index, :show, :destroy]


    def index
        reviews = Review.all
        render json: reviews, status: :ok
    end

    def show
        review = find_review
        render json: review
    end

    def create
        review = Review.create!(create_review_params)
        render json: review
    end

    def destroy
        review = find_review
        review.destroy
        head :no_content 
    end

    private 

    def find_review 
        review = Review.find(params[:id])
    end

    def create_review_params
        params.permit(:user_id, :physical_therapist_id, :users_review, :photo, :stars)
    end

    def render_record_not_found 
        render json: { error: "Review not found" }, status: :not_found 
    end 
end
