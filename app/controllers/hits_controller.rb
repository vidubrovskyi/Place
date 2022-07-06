class HitsController < ApplicationController
  before_action :set_hit, only: %i[show edit update destroy]

  def new
    @hit = Hit.new
  end

  def create
    @hit = Hit.new(hit_params)
    if @hit.save
      redirect_to hit_path(@hit)
    else
      render :new
    end
  end

  def show
  end

  def index
    @hits = Hit.all
  end

  def edit
  end

  def update
    if @hit.update(hit_params)
      redirect_to hit_path(@hit)
    else
      render :edit
    end
  end

  def destroy
    @hit.destroy
    redirect_to hits_path, status: :see_other
  end

  private

  def set_hit
    @hit = Hit.find(params[:id])
  end

  def hit_params
    params.require(:hit).permit(:title, :body, :avatar, shop_ids:[])
  end
end
