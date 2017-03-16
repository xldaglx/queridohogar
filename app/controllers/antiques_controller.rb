class AntiquesController < ApplicationController
  before_action :set_antique, only: [:show, :edit, :update, :destroy]

  # GET /antiques
  # GET /antiques.json
  def index
    @antiques = Antique.all
  end

  # GET /antiques/1
  # GET /antiques/1.json
  def show
  end

  # GET /antiques/new
  def new
    @antique = Antique.new
  end

  # GET /antiques/1/edit
  def edit
  end

  # POST /antiques
  # POST /antiques.json
  def create
    @antique = Antique.new(antique_params)

    respond_to do |format|
      if @antique.save
        format.html { redirect_to @antique, notice: 'Antique was successfully created.' }
        format.json { render :show, status: :created, location: @antique }
      else
        format.html { render :new }
        format.json { render json: @antique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /antiques/1
  # PATCH/PUT /antiques/1.json
  def update
    respond_to do |format|
      if @antique.update(antique_params)
        format.html { redirect_to @antique, notice: 'Antique was successfully updated.' }
        format.json { render :show, status: :ok, location: @antique }
      else
        format.html { render :edit }
        format.json { render json: @antique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /antiques/1
  # DELETE /antiques/1.json
  def destroy
    @antique.destroy
    respond_to do |format|
      format.html { redirect_to antiques_url, notice: 'Antique was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_antique
      @antique = Antique.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def antique_params
      params.require(:antique).permit(:description)
    end
end
