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

    respond_to do |format|
      if @pt.save
        format.html { redirect_to pt_url(@pt), notice: "Pt was successfully created." }
        format.json { render :show, status: :created, location: @pt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pt.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @pt.update(pt_params)
        format.html { redirect_to pt_url(@pt), notice: "Pt was successfully updated." }
        format.json { render :show, status: :ok, location: @pt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pt.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @pt.destroy

    respond_to do |format|
      format.html { redirect_to pts_url, notice: "Pt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_pt
      @pt = Pt.find(params[:id])
    end

    def pt_params
      params.require(:pt).permit(:pt)
    end
end
