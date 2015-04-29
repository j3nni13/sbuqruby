class ParkingsController < ApplicationController
  before_action :set_parking, only: [:show, :edit, :update, :destroy]
  authorize_resource :class => false
  # GET /parkings
  # GET /parkings.json
  def index
    @parkings = Parking.all
  end

  # GET /parkings/1
  # GET /parkings/1.json
  def show

  end

  # GET /parkings/new
  def new
    @parking = parking.new
  end

  # GET /parkings/1/edit
  def edit
  end

  # POST /parkings
  # POST /parkings.json
  def create
    @parking = parking.new(parking_params)

    respond_to do |format|
      if @parking.save
        format.html { redirect_to @parking, notice: 'Parking was successfully created.' }
        format.json { render :show, status: :created, location: @parking }
      else
        format.html { render :new }
        format.json { render json: @parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parkings/1
  # PATCH/PUT /parkings/1.json
  def update
    respond_to do |format|
      if @parking.update(parking_params)
        format.html { redirect_to @parking, notice: 'parking was successfully updated.' }
        format.json { render :show, status: :ok, location: @parking }
      else
        format.html { render :edit }
        format.json { render json: @parking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parkings/1
  # DELETE /parkings/1.json
  def destroy
    @parking.destroy
    respond_to do |format|
      format.html { redirect_to parkings_url, notice: 'parking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parking
      @parking = parking.find(params[:ids])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parking_params
      params.require(:parking).permit(:name)
    end
end

end
