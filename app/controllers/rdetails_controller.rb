class RdetailsController < ApplicationController
  before_action :set_rdetail, only: %i[ show edit update destroy ]

  # GET /rdetails or /rdetails.json
  def index
    @rdetails = Rdetail.all
  end

  # GET /rdetails/1 or /rdetails/1.json
  def show
  end

  # GET /rdetails/new
  def new
    @rdetail = Rdetail.new
  end

  # GET /rdetails/1/edit
  def edit
  end

  # POST /rdetails or /rdetails.json
  def create
    @rdetail = Rdetail.new(rdetail_params)

    respond_to do |format|
      if @rdetail.save
        format.html { redirect_to rdetail_url(@rdetail), notice: "Rdetail was successfully created." }
        format.json { render :show, status: :created, location: @rdetail }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rdetails/1 or /rdetails/1.json
  def update
    respond_to do |format|
      if @rdetail.update(rdetail_params)
        format.html { redirect_to rdetail_url(@rdetail), notice: "Rdetail was successfully updated." }
        format.json { render :show, status: :ok, location: @rdetail }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rdetails/1 or /rdetails/1.json
  def destroy
    @rdetail.destroy

    respond_to do |format|
      format.html { redirect_to rdetails_url, notice: "Rdetail was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rdetail
      @rdetail = Rdetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rdetail_params
      params.require(:rdetail).permit(:restaurant_id, :booking_duration, :min_booking, :max_booking, :last_booking_time, :big_table_count, :max_diners_at_current_time)
    end
end
