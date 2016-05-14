class CpsController < ApplicationController
  before_action :set_cp, only: [:show, :edit, :update, :destroy]

  # GET /cps
  # GET /cps.json
  def index
    @cps = Cp.all
  end

  # GET /cps/1
  # GET /cps/1.json
  def show
  end

  # GET /cps/new
  def new
    @cp = Cp.new
  end

  # GET /cps/1/edit
  def edit
  end

  # POST /cps
  # POST /cps.json
  def create
    @cp = Cp.new(cp_params)

    respond_to do |format|
      if @cp.save
        format.html { redirect_to @cp, notice: 'Cp was successfully created.' }
        format.json { render :show, status: :created, location: @cp }
      else
        format.html { render :new }
        format.json { render json: @cp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cps/1
  # PATCH/PUT /cps/1.json
  def update
    respond_to do |format|
      if @cp.update(cp_params)
        format.html { redirect_to @cp, notice: 'Cp was successfully updated.' }
        format.json { render :show, status: :ok, location: @cp }
      else
        format.html { render :edit }
        format.json { render json: @cp.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cps/1
  # DELETE /cps/1.json
  def destroy
    @cp.destroy
    respond_to do |format|
      format.html { redirect_to cps_url, notice: 'Cp was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cp
      @cp = Cp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cp_params
      params.require(:cp).permit(:codigo, :asentamiento, :tipoAsentamiento, :municipio, :estado)
    end
end
