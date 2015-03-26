class VenuetypesController < ApplicationController
  before_action :set_venuetype, only: [:show, :edit, :update, :destroy]

  # GET /venuetypes
  # GET /venuetypes.json
  def index
    @venuetypes = Venuetype.all
  end

  # GET /venuetypes/1
  # GET /venuetypes/1.json
  def show

  end

  # GET /venuetypes/new
  def new
    @venuetype = Venuetype.new
  end

  # GET /venuetypes/1/edit
  def edit
  end

  # POST /venuetypes
  # POST /venuetypes.json
  def create
    @venuetype = Venuetype.new(venuetype_params)

    respond_to do |format|
      if @venuetype.save
        format.html { redirect_to @venuetype, notice: 'Venuetype was successfully created.' }
        format.json { render :show, status: :created, location: @venuetype }
      else
        format.html { render :new }
        format.json { render json: @venuetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venuetypes/1
  # PATCH/PUT /venuetypes/1.json
  def update
    respond_to do |format|
      if @venuetype.update(venuetype_params)
        format.html { redirect_to @venuetype, notice: 'Venuetype was successfully updated.' }
        format.json { render :show, status: :ok, location: @venuetype }
      else
        format.html { render :edit }
        format.json { render json: @venuetype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venuetypes/1
  # DELETE /venuetypes/1.json
  def destroy
    @venuetype.destroy
    respond_to do |format|
      format.html { redirect_to venuetypes_url, notice: 'Venuetype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venuetype
      @venuetype = Venuetype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venuetype_params
      params.require(:venuetype).permit(:name)
    end
end
