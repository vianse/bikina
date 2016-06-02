class RegistrosController < ApplicationController
  before_action :set_registro, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json
  # GET /registros
  # GET /registros.json
  def index
     @usuario = User.where(:id => current_user.id).pluck(:id).first
     @registros = Registro.where(:grupo_id => params[:clave]).paginate(:page => params[:page]).order('id DESC')
     @name = Grupo.where(:clave => params[:clave]).pluck(:nombre).first
     @grupos = Grupo.all
     @grupo = Grupo.new
  end
  def eliminar
    @registro = Unir.where(:grupo_id => params[:clave]).where(:user_id => current_user.id).first
    @registro.destroy
    redirect_to "/"
  end
    def eliminar_imagenes
    @registro = Foto.find(:id)
    @registro.delete
    redirect_to :back
  end
  # GET /registros/1
  # GET /registros/1.json
  def show
      @fotos = Foto.where(:registro_id => @registro.id)
   
      @usuario = User.where(:id => current_user.id).pluck(:id).first
      @unir = Unir.new
      @nombre = Grupo.where(:clave => params[:clave]).pluck(:nombre).first
      @descripcion = Grupo.where(:clave => params[:clave]).pluck(:descripcion).first
      @registros = Registro.all
      @grupos = Grupo.all
      @grupo = Grupo.new
      @foto = Foto.new
      @comentario = Comentario.new
      @respuestum = Respuestum.new
      #---- Actualiza el contador -->
      @registro = Registro.find(params[:id])
      @query = Registro.where(:id => @registro).pluck(:user_id).first
      if @query.to_i == current_user.id
      else
        @count=@registro.countclicks+1
        @registro.countclicks = @count
        @registro.save
      end
      #------Fin--------------------->



  end
  def comenzar
    @nombre= Perfil.where(:user_id => current_user.id).pluck(:nombre).first
    @registros = Registro.where(:grupo_id => params[:clave]).paginate(:page => params[:page]).order('id DESC')
     @name = Grupo.where(:clave => params[:clave]).pluck(:nombre).first
     @grupos = Grupo.all
     @grupo = Grupo.new
  end

  def join
     @unir = Unir.new
     @nombre = Grupo.where(:clave => params[:clave]).pluck(:nombre).first
     @descripcion = Grupo.where(:clave => params[:clave]).pluck(:descripcion).first
     @registros = Registro.all
     @grupos = Grupo.where(:clave => params[:clave]).first
     @grupo = Grupo.new

  end
  def private
     @unir = Unir.new
     @nombre = Grupo.where(:clave => params[:clave]).pluck(:nombre).first
     @descripcion = Grupo.where(:clave => params[:clave]).pluck(:descripcion).first
     @registros = Registro.all
     @grupos = Grupo.all
     @grupo = Grupo.new

  end

  # GET /registros/new
  def new
    @registro = Registro.new
    @grupo = Grupo.new
  end

  # GET /registros/1/edit
  def edit
  end

  # POST /registros
  # POST /registros.json
  def create
    @registro = Registro.new(registro_params)

    respond_to do |format|
      if @registro.save
        format.html { redirect_to '/' }
        format.json { render :show, status: :created, location: @registro }
      else
        format.html { render :new }
        format.json { render json: @registro.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registros/1
  # PATCH/PUT /registros/1.json
  def update
    @registro.update(registro_params)
    respond_with @registro
    # respond_to do |format|
    #   if @registro.update(registro_params)
    #     format.html { redirect_to @registro, notice: 'Registro was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @registro }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @registro.errors, status: :unprocessable_entity }
    #   end
    # end
  end
  def recomienda
    @registro = Registro.new
    @grupo = Grupo.new
  end

  # DELETE /registros/1
  # DELETE /registros/1.json
  def destroy
    @registro.destroy
    respond_to do |format|
      format.html { redirect_to :back}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registro
      @registro = Registro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def registro_params
      params.require(:registro).permit(:titulo, :descripcion, :direccion, :telefono1,:costo, :correo, :sitioweb, :logo, :categoria, :user_id,:grupo_id,:countclicks, :descripcionlarga,:recomendado)
    end
end
