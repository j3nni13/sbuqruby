class EventtypesController < ApplicationController
  before_action :set_eventtype, only: [:show, :edit, :update, :destroy]
  authorize_resource :class => false
  # GET /eventtypes
  # GET /eventtypes.json
  def index
    @eventtypes = Eventtype.all
  end

  # GET /eventtypes/1
  # GET /eventtypes/1.json
  def show
  end

  # GET /eventtypes/new
  def new
    @eventtype = Eventtype.new
  end

  # GET /eventtypes/1/edit
  def edit
  end

  # POST /eventtypes
  # POST /eventtypes.json
  def create
    @eventtype = Eventtype.new(eventtype_params)

    respond_to do |format|
      if @eventtype.save
        format.html { redirect_to @eventtype, notice: 'Eventtype was successfully created.' }
        format.json { render :show, status: :created, location: @eventtype }
      else
        format.html { render :new }
        format.json { render json: @eventtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /eventtypes/1
  # PATCH/PUT /eventtypes/1.json
  def update
    respond_to do |format|
      if @eventtype.update(eventtype_params)
        format.html { redirect_to @eventtype, notice: 'Eventtype was successfully updated.' }
        format.json { render :show, status: :ok, location: @eventtype }
      else
        format.html { render :edit }
        format.json { render json: @eventtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /eventtypes/1
  # DELETE /eventtypes/1.json
  def destroy
    @eventtype.destroy
    respond_to do |format|
      format.html { redirect_to eventtypes_url, notice: 'Eventtype was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_eventtype
      @eventtype = Eventtype.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def eventtype_params
      params.require(:eventtype).permit(:name)
    end
end
