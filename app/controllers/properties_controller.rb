class PropertiesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :edit, :update, :destroy]
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  # GET /properties
  # GET /properties.json
  def index
    #@properties = Property.select('properties.*,property_images.*').joins(:property_images).where('property_images.position' => '1').where(user_id: current_user.id)
    @properties = Property.where(user_id: current_user.id)
    #GetFirstImage
    @property_images = PropertyImage.joins(:property).where('position' => '1').where('properties.user_id' => current_user.id) # Assuming place_id is foreign_key to places table
    
  end

  def list
    lat = params[:property_lat]
    lng = params[:property_lng]
    @properties = Property
                    .select('( 6371 * acos( cos( radians('+lat+') ) * cos( radians( lat ) ) * cos( radians( lng ) - radians('+lng+') ) + sin( radians('+lat+') ) * sin( radians( lat ) ) ) ) AS distance, types.description as descT, properties.*, operations.description as descO, currencies.description as descC ')
                    .joins(:type)
                    .joins(:operation)
                    .joins(:currency)
                    .having('distance < 3')
    @property_images = PropertyImage.joins(:property).where('position' => '1') # Assuming place_id is foreign_key to places table

  end

  def listResults
     types = params[:type][:id]
     operations = params[:operation][:id]
     baths = params[:baths]
     beds = params[:beds]
     types = types.uniq.reject(&:empty?)
     operations = operations.uniq.reject(&:empty?)
     bathsbeds="";
     count = 0
     types.each do |t|
          if count == 0
            types = "types.id = "+t
          else
            types += " OR types.id = "+t
          end
        count += 1
      end
     count = 0
     operations.each do |t|
          if count == 0
            operations = "operations.id = "+t
          else
            operations += " OR operations.id = "+t
          end
        count += 1
      end
        bathsbeds = "bathdroom >= "+baths+ " AND rooms >= "+beds
     lat = params[:property_lat].to_s
     lng = params[:property_lng].to_s
     @properties = Property
                    .select('( 6371 * acos( cos( radians('+lat+') ) * cos( radians( lat ) ) * cos( radians( lng ) - radians('+lng+') ) + sin( radians('+lat+') ) * sin( radians( lat ) ) ) ) AS distance, types.description as descT, properties.*, operations.description as descO, currencies.description as descC ')
                    .joins(:type)
                    .joins(:operation)
                    .joins(:currency)
                    .where(types)
                    .where(operations)
                    .where(bathsbeds)
                    .having('distance < 3')
    @property_images = PropertyImage.joins(:property).where('position' => '1') # Assuming place_id is foreign_key to places table
    respond_to do |format|
      format.json {
         render :json => {
            :properties => @properties,
            :property_images => @property_images,
         }, :status => 200 
       } 
    end
  end
  # GET /properties/1
  # GET /properties/1.json
  def show
   @property = Property
                .includes(:type)
                .includes(:operation)
                .includes(:currency)
                .includes(:property_images)
                .includes(:user)
                .find(params[:id]);
   @additionals_property = PropertyAdditional.joins(:additional).where('property_id'=>params[:id]).order('additionals.description ASC')
  end

  # GET /properties/new
  def new
    @property = Property.new
    @additionals = Additional.all.order('description ASC')
  end

  # GET /properties/1/edit
  def edit
    @additionals = Additional.all.order('description ASC')
    @additionals_property = PropertyAdditional.where('property_id'=>params[:id])
    @images = PropertyImage.where('property_id' => params[:id])
    @property = Property.find(params[:id]);

    
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = Property.new(property_params)
    @property.user_id = current_user.id

    respond_to do |format|
      if @property.save
        format.html { redirect_to @property, notice: 'Property was successfully created.' }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
        if @property.update(property_params)
          if defined?(property_image_params)
             if @property_image.update(property_image_params)
            format.html { redirect_to @property, notice: 'Property was successfully updated.' }
            format.json { render :show, status: :ok, location: @property }
             end
          else
            format.html { redirect_to @property, notice: 'Property was successfully updated.' }
            format.json { render :show, status: :ok, location: @property }
          end
        else
          format.html { render :edit }
          format.json { render json: @property.errors, status: :unprocessable_entity }
        end
    end
  end
   
  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_params
      params.require(:property).permit(:title, :price, :currency_id, :phone, :phone2, :email, :description, :state, :city,:neighborhood, :colony, :street, :number, :cp, :lat, :lng, :address_google, :antique, :available, :park, :bathdroom, :halfbath, :rooms, :m2, :totalm, :type_id, :operation_id, :additional_ids => [], property_images_attributes: [:id, :property_id, :image, :position])
    end
end
