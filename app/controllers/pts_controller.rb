class PtsController < ApplicationController
  before_action :set_pt, only: %i[ show edit update destroy ]

  # GET /pts or /pts.json
  def index
    @pts = Pt.all
  end

  # GET /pts/1 or /pts/1.json
  def show
  end

  # GET /pts/new
  def new
    @pt = Pt.new
  end

  # GET /pts/1/edit
  def edit
  end

  # POST /pts or /pts.json
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

  # PATCH/PUT /pts/1 or /pts/1.json
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

  # DELETE /pts/1 or /pts/1.json
  def destroy
    @pt.destroy

    respond_to do |format|
      format.html { redirect_to pts_url, notice: "Pt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pt
      @pt = Pt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pt_params
      params.require(:pt).permit(:pt)
    end
end
