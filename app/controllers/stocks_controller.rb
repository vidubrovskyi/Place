class StocksController < ApplicationController
  before_action :set_stock, only: %i[show edit update destroy]

  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)
    if @stock.save
      redirect_to stock_path(@stock)
    else
      render :new
    end
  end

  def show
  end

  def index
    @search = Stock.ransack(params[:q])
    @pagy, @stocks = pagy_countless(@search.result(distinct: true), items: 4)

    respond_to do |format|
      format.html # GET
      format.turbo_stream # POST
    end
  end

  def edit
  end

  def update
    if @stock.update(stock_params)
      redirect_to stock_path(@stock)
    else
      render :edit
    end
  end

  def destroy
    @stock.destroy
    redirect_to stocks_path, status: :see_other
  end

  private

  def set_stock
    @stock = Stock.find(params[:id])
  end

  def stock_params
    params.require(:stock).permit(:title, :body, :avatar, shop_ids:[])
  end
end
