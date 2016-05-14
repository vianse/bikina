class UnirsController < ApplicationController
  before_action :set_unir, only: [:show, :edit, :update, :destroy]

  # GET /unirs
  # GET /unirs.json
  def index
    @unirs = Unir.all
  end

  # GET /unirs/1
  # GET /unirs/1.json
  def show
  end

  # GET /unirs/new
  def new
    @unir = Unir.new
  end

  # GET /unirs/1/edit
  def edit
  end

  # POST /unirs
  # POST /unirs.json
  def create
    @unir = Unir.new(unir_params)

    respond_to do |format|
      if @unir.save
        format.html { redirect_to '/', notice: 'Unir was successfully created.' }
        format.json { render :show, status: :created, location: @unir }
      else
        format.html { render :new }
        format.json { render json: @unir.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unirs/1
  # PATCH/PUT /unirs/1.json
  def update
    respond_to do |format|
      if @unir.update(unir_params)
        format.html { redirect_to @unir, notice: 'Unir was successfully updated.' }
        format.json { render :show, status: :ok, location: @unir }
      else
        format.html { render :edit }
        format.json { render json: @unir.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unirs/1
  # DELETE /unirs/1.json
  def destroy
    @unir= Unir.find_by(:grupo_id)
    @unir.destroy
    respond_to do |format|
      format.html { redirect_to unirs_url, notice: 'Unir was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unir
      @unir = Unir.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unir_params
      params.require(:unir).permit(:grupo_id, :user_id)
    end
end
