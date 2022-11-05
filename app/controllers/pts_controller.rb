class PtsController < ApplicationController
  before_action :set_pt, only: %i[ show edit update destroy ]

  def index
    @pts = Pt.all
  end

  def show
  end

  def new
    @pt = Pt.new
  end

  def edit
  end

  def create
    @pt = Pt.new(pt_params)

    if @pt.save
      redirect_to pt_url(@pt), notice: "Pt was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @pt.update(pt_params)
      redirect_to pt_url(@pt), notice: "Pt was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @pt.destroy
    redirect_to pts_url, notice: "Pt was successfully destroyed."
  end

  private

    def set_pt
      @pt = Pt.find(params[:id])
    end

    def pt_params
      params.require(:pt).permit(:pt)
    end
end
