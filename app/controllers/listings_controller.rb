class ListingsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  # GET /listings
  # GET /listings.json

  layout 'nofoot'

    # Add and remove favorite listings
  # for current_user
   
  def index
    @pictures = Listing.all
    @search = Listing.search(params[:q])
    @listings = @search.result(distinct: true).page(params[:page]).per(24)
    @hash = Gmaps4rails.build_markers(@listings) do |listing, marker|
    marker.lat listing.latitude
    marker.lng listing.longitude
    marker.infowindow render_to_string(:partial => 'listings/mappopup', :layout => false, :locals => {:@listing => listing})
  end
  end

  def search
    index
    render :index
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @listings = Listing.friendly.find(params[:id])
  
  end

  # GET /listings/new
  def new
    @listing = Listing.new
    @venuetypes = Venuetype.all
  end

  # GET /listings/1/edit
  def edit
    @venuetypes = Venuetype.all
    authorize! :manage, @listing
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = current_user.listings.new(listing_params)

    respond_to do |format|
      if @listing.save

         if params[:photos]
        #===== The magic is here ;)
        params[:photos].each { |photo|
            @listing.pictures.create(photo: photo)
          }
      end

        format.html { redirect_to @listing, notice: 'Listing was successfully created.' }
        format.json { render :show, status: :created, location: @listing }
        
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
     
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    @listing = Listing.friendly.find(params[:id])
    authorize! :manage, @listing

    respond_to do |format|

      if @listing.update_attributes(listing_params)
        if params[:photos]
          # The magic is here ;)
          params[:photos].each { |photo|
            @listing.pictures.create(photo: photo)
          }
        end

      if @listing.update(listing_params)
        format.html { redirect_to :back }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end
end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    authorize! :manage, @listing
    respond_to do |format|
      format.html { redirect_to listings_url, notice: 'Listing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :contactname, :contacttitle, :phonenumber, :email, :mincapacity, :maxcapacity, :eventtype, :street, :street2, :city, :province, :country, :postalcode, :location, :price, :description, :pictures, :photo, venuetype_ids: [], eventtype_ids: [], parking_ids: [], amenity_ids: [], food_ids: [], alcohol_ids: [], reception_ids: [])
    end

    def show_venuetypes
      @venuetype = Venuetype.find(params[:id])
   end

end
