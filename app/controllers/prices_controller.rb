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

    respond_to do |format|
      if @price.save
        format.html { redirect_to price_url(@price), notice: "Price was successfully created." }
        format.json { render :show, status: :created, location: @price }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @price.update(price_params)
        format.html { redirect_to price_url(@price), notice: "Price was successfully updated." }
        format.json { render :show, status: :ok, location: @price }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @price.destroy

    respond_to do |format|
      format.html { redirect_to prices_url, notice: "Price was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_price
      @price = Price.find(params[:id])
    end

    def price_params
      params.require(:price).permit(:price)
    end
end
