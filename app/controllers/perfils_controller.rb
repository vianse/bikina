class PerfilsController < ApplicationController
  before_action :set_perfil, only: [:show, :edit, :update, :destroy]

  # GET /perfils
  # GET /perfils.json
  def index
    @perfils = Perfil.all
  end

  # GET /perfils/1
  # GET /perfils/1.json
  def show
    @grupo = Unir.where(:user_id => current_user.id).pluck(:grupo_id).first
    redirect_to "/registros?clave=" + @grupo + "&page=1"
  end

  # GET /perfils/new
  def new
    @perfil = Perfil.new
  end

  # GET /perfils/1/edit
  def edit
    @user = current_user.id
    #logger.debug "Id perfil #{Perfil.where(:user_id => @user).pluck(:id)}"
    if params[:id].to_i ==  Perfil.where(:user_id => @user).pluck(:id).first

      else 
      @grupo = Unir.where(:user_id => current_user.id).pluck(:grupo_id).first
      redirect_to "/registros?clave=" + @grupo + "&page=1"
    end
  end

  # POST /perfils
  # POST /perfils.json
  def create
    @perfil = Perfil.new(perfil_params)

    respond_to do |format|
      if @perfil.save
        format.html { redirect_to '/' }
        format.json { render :show, status: :created, location: @perfil }
      else
        format.html { render :new }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /perfils/1
  # PATCH/PUT /perfils/1.json
  def update
    respond_to do |format|
      if @perfil.update(perfil_params)
        format.html { redirect_to "/", notice: 'Perfil was successfully updated.' }
        format.json { render :show, status: :ok, location: @perfil }
      else
        format.html { render :edit }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perfils/1
  # DELETE /perfils/1.json
  def destroy
    @perfil.destroy
    respond_to do |format|
      format.html { redirect_to perfils_url, notice: 'Perfil was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfil
      @perfil = Perfil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perfil_params
      params.require(:perfil).permit(:nombre, :cp, :colonio, :user_id,:photo,:remote_photo_url)
    end
end
