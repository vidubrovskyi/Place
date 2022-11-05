class PricesController < ApplicationController
  before_action :set_price, only: %i[ show edit update destroy ]

  def index
    @prices = Price.all
  end

  def show
  end

  def new
    @price = Price.new
  end

  def edit
  end

  def create
    @price = Price.new(price_params)

    if @price.save
      redirect_to price_url(@price), notice: "Price was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @price.update(price_params)
      redirect_to price_url(@price), notice: "Price was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @price.destroy
    redirect_to prices_url, notice: "Price was successfully destroyed."
  end

  private
    def set_price
      @price = Price.find(params[:id])
    end

    def price_params
      params.require(:price).permit(:price)
    end
end
