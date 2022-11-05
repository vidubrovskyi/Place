class ShopsController < ApplicationController

  before_action :set_shop, only: %i[ show edit update destroy vote hovercard]

  def index
    @search = Shop.ransack(params[:q])
    @pagy, @shops = pagy_countless(@search.result(distinct: true), items: 5)
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def vote
    case params[:type]
    when "upvote"
      @shop.upvote!(current_user)
    when "downvote"
      @shop.downvote!(current_user)
    else
      return redirect_to request.url, alert: "no such vote type"
    end
    respond_to do |format|
      format.html do
        redirect_to @shop
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(@shop, partial:"shops/shop", locals: {shop: @shop})
      end
    end
  end

  def hovercard
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = current_user.shops.build(shop_params)
    if @shop.save
      redirect_to shop_path(@shop), notice: "Shop was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      redirect_to shop_path(@shop), notice: "Shop was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @shop.destroy
    redirect_to shops_path, status: :see_other, notice: "Shop was successfully destroyed."
  end

  private

  def shop_params
    params.require(:shop).permit(:name, :address, :description, :contact, :avatar, benefit_ids: [], pt_ids: [], price_ids: [], images: [])
  end

  def set_shop
    @shop = Shop.find(params[:id])
  end
end
