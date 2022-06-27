class ReviewsController < ApplicationController

  before_action :get_shop
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = @shop.reviews
  end

  def show
  end

  def new
    @review = @shop.reviews.build
  end

  def create
    @review = @shop.reviews.build(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to shop_path(@shop)
    else
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    if @review.update review_params
      redirect_to shop_path(@shop)
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to shop_path(@shop)
  end

  private

  def get_shop
    @shop = Shop.find(params[:shop_id])
  end

  def set_review
    @review = @shop.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:message, :shop_id)
  end
end
