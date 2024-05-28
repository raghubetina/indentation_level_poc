class RunUnitsController < ApplicationController
  before_action :set_run_unit, only: %i[show edit update destroy]

  # GET /run_units or /run_units.json
  def index
    @run_units = RunUnit.all
  end

  # GET /run_units/1 or /run_units/1.json
  def show
  end

  # GET /run_units/new
  def new
    @run_unit = RunUnit.new
  end

  # GET /run_units/1/edit
  def edit
  end

  # POST /run_units or /run_units.json
  def create
    @run_unit = RunUnit.new(run_unit_params)

    respond_to do |format|
      if @run_unit.save
        format.html { redirect_to run_unit_url(@run_unit), notice: "Run unit was successfully created." }
        format.json { render :show, status: :created, location: @run_unit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @run_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /run_units/1 or /run_units/1.json
  def update
    respond_to do |format|
      if @run_unit.update(run_unit_params)
        format.html { redirect_to run_unit_url(@run_unit), notice: "Run unit was successfully updated." }
        format.json { render :show, status: :ok, location: @run_unit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @run_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /run_units/1 or /run_units/1.json
  def destroy
    @run_unit.destroy!

    respond_to do |format|
      format.html { redirect_to run_units_url, notice: "Run unit was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_run_unit
    @run_unit = RunUnit.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def run_unit_params
    params.require(:run_unit).permit(:title, :description, :indentation_level, :run_id)
  end
end
