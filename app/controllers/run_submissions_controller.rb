class RunSubmissionsController < ApplicationController
  before_action :set_run_submission, only: %i[show edit update destroy]

  # GET /run_submissions or /run_submissions.json
  def index
    @run_submissions = current_user.run_submissions
  end

  # GET /run_submissions/1 or /run_submissions/1.json
  def show
  end

  # GET /run_submissions/new
  def new
    @run_submission = RunSubmission.new
  end

  # GET /run_submissions/1/edit
  def edit
  end

  # POST /run_submissions or /run_submissions.json
  def create
    @run_submission = RunSubmission.new(run_submission_params)

    respond_to do |format|
      if @run_submission.save
        format.html { redirect_to run_submission_url(@run_submission), notice: "Run submission was successfully created." }
        format.json { render :show, status: :created, location: @run_submission }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @run_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /run_submissions/1 or /run_submissions/1.json
  def update
    respond_to do |format|
      if @run_submission.update(run_submission_params)
        format.html { redirect_to run_submission_url(@run_submission), notice: "Run submission was successfully updated." }
        format.json { render :show, status: :ok, location: @run_submission }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @run_submission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /run_submissions/1 or /run_submissions/1.json
  def destroy
    @run_submission.destroy!

    respond_to do |format|
      format.html { redirect_to run_submissions_url, notice: "Run submission was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_run_submission
    @run_submission = RunSubmission.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def run_submission_params
    params.require(:run_submission).permit(:run_id, :user_id, :progress)
  end
end
