class ShopsController < ApplicationController

  before_action :set_shop, only: [:show, :edit, :update, :destroy]

  def index
    #@shops = Shop.all
    @search = Shop.ransack(params[:q])
    @shops = @search.result(distinct: true)
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.shops.build(shop_params)
    if @shop.save
      redirect_to shop_path(@shop)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to shop_path(@shop)
    else
      render :edit
    end
  end

  def destroy
    @shop.destroy
    redirect_to shops_path, status: :see_other
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :description, :contact, benefit_ids: [], pt_ids: [], images: [])
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
