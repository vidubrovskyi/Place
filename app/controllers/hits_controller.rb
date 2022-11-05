class HitsController < ApplicationController
  before_action :set_hit, only: %i[show edit update destroy]

  def new
    @hit = Hit.new
  end

  def create
    @hit = Hit.new(hit_params)
    if @hit.save
      redirect_to hit_path(@hit), notice: "Hit was successfully created."
    else
      redirect_to root_path, status: :unprocessable_entity
    end
  end

  def show
  end

  def index
    @search = Hit.ransack(params[:q])
    @pagy, @hits = pagy_countless(@search.result(distinct: true), items: 4)
    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def edit
  end

  def update
    if @hit.update(hit_params)
      redirect_to hit_path(@hit), notice: "Hit was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @hit.destroy
    redirect_to hits_path, status: :see_other, notice: "Hit was successfully destroyed."
  end

  private

  def set_hit
    @hit = Hit.find(params[:id])
  end

  def hit_params
    params.require(:hit).permit(:title, :body, :avatar, shop_ids:[])
  end
end
