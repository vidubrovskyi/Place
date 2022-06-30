class BenefitsController < ApplicationController
  before_action :set_benefit, only: %i[ show edit update destroy ]

  # GET /benefits or /benefits.json
  def index
    @benefits = Benefit.all
  end

  # GET /benefits/1 or /benefits/1.json
  def show
  end

  # GET /benefits/new
  def new
    @benefit = Benefit.new
  end

  # GET /benefits/1/edit
  def edit
  end

  # POST /benefits or /benefits.json
  def create
    @benefit = Benefit.new(benefit_params)
      if @benefit.save
        redirect_to benefits_path
      else
        render :new
      end
  end

  # PATCH/PUT /benefits/1 or /benefits/1.json
  def update
      if @benefit.update(benefit_params)
        redirect_to benefits_path
      else
        render :edit
      end
  end

  # DELETE /benefits/1 or /benefits/1.json
  def destroy
    @benefit.destroy
    redirect_to benefits_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_benefit
      @benefit = Benefit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def benefit_params
      params.require(:benefit).permit(:children)
    end
end
