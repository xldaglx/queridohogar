class PropertyImagesController < ApplicationController
  before_action :set_property_image, only: [:show, :edit, :update, :destroy]

  # GET /property_images
  # GET /property_images.json
  def index
    @property_images = PropertyImage.all
  end

  # GET /property_images/1
  # GET /property_images/1.json
  def show
  end

  # GET /property_images/new
  def new
    @property_image = PropertyImage.new
  end

  # GET /property_images/1/edit
  def edit
  end

  # POST /property_images
  # POST /property_images.json
  def create
    @property_image = PropertyImage.new(property_image_params)

    respond_to do |format|
      if @property_image.save
        format.html { redirect_to @property_image, notice: 'Property image was successfully created.' }
        format.json { render :show, status: :created, location: @property_image }
      else
        format.html { render :new }
        format.json { render json: @property_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property_images/1
  # PATCH/PUT /property_images/1.json
  def update
    respond_to do |format|
      if @property_image.update(property_image_params)
        format.html { redirect_to @property_image, notice: 'Property image was successfully updated.' }
        format.json { render :show, status: :ok, location: @property_image }
      else
        format.html { render :edit }
        format.json { render json: @property_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property_images/1
  # DELETE /property_images/1.json
  def destroy
    @property_image.destroy
    respond_to do |format|
      format.html { redirect_to property_images_url, notice: 'Property image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_image
      @property_image = PropertyImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def property_image_params
      params.require(:property_image).permit(:property_id, :image, :position)
    end
end
