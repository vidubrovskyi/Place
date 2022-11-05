class BenefitsController < ApplicationController
  before_action :set_benefit, only: %i[ show edit update destroy ]

  def index
    @benefits = Benefit.all
  end

  def show
  end

  def new
    @benefit = Benefit.new
  end

  def edit
  end

  def create
    @benefit = Benefit.new(benefit_params)

    if @benefit.save
      redirect_to benefits_path, notice: "Benefit was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @benefit.update(benefit_params), notice: "Benefit was successfully updated."
      redirect_to benefits_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @benefit.destroy
    redirect_to benefits_path, notice: "Benefit was successfully destroyed."
  end

  private

    def set_benefit
      @benefit = Benefit.find(params[:id])
    end

    def benefit_params
      params.require(:benefit).permit(:children)
    end
end
