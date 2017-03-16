class AdditionalsController < ApplicationController
  before_action :set_additional, only: [:show, :edit, :update, :destroy]

  # GET /additionals
  # GET /additionals.json
  def index
    @additionals = Additional.all.order('description ASC')
  end

  # GET /additionals/1
  # GET /additionals/1.json
  def show
  end

  # GET /additionals/new
  def new
    @additional = Additional.new
  end

  # GET /additionals/1/edit
  def edit
  end

  # POST /additionals
  # POST /additionals.json
  def create
    @additional = Additional.new(additional_params)

    respond_to do |format|
      if @additional.save
        format.html { redirect_to @additional, notice: 'Additional was successfully created.' }
        format.json { render :show, status: :created, location: @additional }
      else
        format.html { render :new }
        format.json { render json: @additional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /additionals/1
  # PATCH/PUT /additionals/1.json
  def update
    respond_to do |format|
      if @additional.update(additional_params)
        format.html { redirect_to @additional, notice: 'Additional was successfully updated.' }
        format.json { render :show, status: :ok, location: @additional }
      else
        format.html { render :edit }
        format.json { render json: @additional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /additionals/1
  # DELETE /additionals/1.json
  def destroy
    @additional.destroy
    respond_to do |format|
      format.html { redirect_to additionals_url, notice: 'Additional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_additional
      @additional = Additional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def additional_params
      params.require(:additional).permit(:description, :image, :category)
    end
end
