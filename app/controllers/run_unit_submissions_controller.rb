class RunUnitSubmissionsController < ApplicationController
  before_action :set_run_unit_submission, only: %i[show edit update destroy]

  # GET /run_unit_submissions or /run_unit_submissions.json
  def index
    @run_unit_submissions = current_user.run_unit_submissions
  end

  # GET /run_unit_submissions/1 or /run_unit_submissions/1.json
  def show
  end

  # GET /run_unit_submissions/new
  def new
    @run_unit_submission = RunUnitSubmission.new
  end

  # GET /run_unit_submissions/1/edit
  def edit
  end

  # POST /run_unit_submissions or /run_unit_submissions.json
  def create
    @run_unit_submission = RunUnitSubmission.new(run_unit_submission_params)

    respond_to do |format|
      if @run_unit_submission.save
        format.html { redirect_to run_unit_submission_url(@run_unit_submission), notice: "Run unit submission was successfully created." }
        format.json { render :show, status: :created, location: @run_unit_submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @run_unit_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /run_unit_submissions/1 or /run_unit_submissions/1.json
  def update
    respond_to do |format|
      if @run_unit_submission.update(run_unit_submission_params)
        format.html { redirect_to run_unit_submission_url(@run_unit_submission), notice: "Run unit submission was successfully updated." }
        format.json { render :show, status: :ok, location: @run_unit_submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @run_unit_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /run_unit_submissions/1 or /run_unit_submissions/1.json
  def destroy
    @run_unit_submission.destroy!

    respond_to do |format|
      format.html { redirect_to run_unit_submissions_url, notice: "Run unit submission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_run_unit_submission
    @run_unit_submission = RunUnitSubmission.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def run_unit_submission_params
    params.require(:run_unit_submission).permit(:run_submission_id, :user_id, :run_id, :run_unit_id, :progress)
  end
end
