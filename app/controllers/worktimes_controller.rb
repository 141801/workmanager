class WorktimesController < ApplicationController
  before_action :set_worktime, only: [:show, :edit, :update, :destroy]

  # GET /worktimes
  # GET /worktimes.json
  def index
    @worktimes = Worktime.all
  end

  # GET /worktimes/1
  # GET /worktimes/1.json
  def show
  end

  # GET /worktimes/new
  def new
    @worktime = Worktime.new
  end

  # GET /worktimes/1/edit
  def edit
  end

  # POST /worktimes
  # POST /worktimes.json
  def create
    @worktime = Worktime.new(worktime_params)
    @worktime.user=User.find(2)
    respond_to do |format|
      if @worktime.save
        format.html { redirect_to @worktime, notice: 'Worktime was successfully created.' }
        format.json { render :show, status: :created, location: @worktime }
      else
        format.html { render :new }
        format.json { render json: @worktime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /worktimes/1
  # PATCH/PUT /worktimes/1.json
  def update
    respond_to do |format|
      if @worktime.update(worktime_params)
        format.html { redirect_to @worktime, notice: 'Worktime was successfully updated.' }
        format.json { render :show, status: :ok, location: @worktime }
      else
        format.html { render :edit }
        format.json { render json: @worktime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /worktimes/1
  # DELETE /worktimes/1.json
  def destroy
    @worktime.destroy
    respond_to do |format|
      format.html { redirect_to worktimes_url, notice: 'Worktime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worktime
      @worktime = Worktime.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def worktime_params
      params.require(:worktime).permit(:ontime, :offtime)
    end
end
