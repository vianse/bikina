class GruposController < ApplicationController
  before_action :set_grupo, only: [:show, :edit, :update, :destroy]

  # GET /grupos
  # GET /grupos.json
  def index
    @grupos = Grupo.all
  end

  # GET /grupos/1
  # GET /grupos/1.json
  def show
  end

  # GET /grupos/new
  def new
    @grupo = Grupo.new
  end

  # GET /grupos/1/edit
  def edit
  end

  # POST /grupos
  # POST /grupos.json
  def create
    @grupo = Grupo.new(grupo_params)
    logger.debug grupo_params[:nombre]
    respond_to do |format|
      if @grupo.save
  RestClient.post "https://api:key-e7d79c66e74391fdf48b657624f23ddc"\
  "@api.mailgun.net/v3/sandboxb9c2dadab0ea49f6b7130d1091646c59.mailgun.org/messages",
  :from => "Bikina <no-reply@bikina.mx>",
  :to => "krlos013@gmail.com",
  :subject => "Solicitud de creación de directorio",
  :html => "El usuario #{current_user.email} solicita la creación de un nuevo directorio, a continuación los detalles:"\
           "<p>Nombre: #{grupo_params[:nombre]}, clave: #{grupo_params[:clave]}</p>"\
           "<p>Descripción: #{grupo_params[:descripcion]} </p>"
        format.html { redirect_to '/', notice: 'Grupo was successfully created.' }
        format.json { render :show, status: :created, location: @grupo }
      else
        format.html { render :new }
        format.json { render json: @grupo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grupos/1
  # PATCH/PUT /grupos/1.json
  def update
    respond_to do |format|
      if @grupo.update(grupo_params)
        format.html { redirect_to @grupo, notice: 'Grupo was successfully updated.' }
        format.json { render :show, status: :ok, location: @grupo }
      else
        format.html { render :edit }
        format.json { render json: @grupo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupos/1
  # DELETE /grupos/1.json
  def destroy
    @grupo.destroy
    respond_to do |format|
      format.html { redirect_to grupos_url, notice: 'Grupo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupo
      @grupo = Grupo.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def grupo_params
      params.require(:grupo).permit(:nombre, :descripcion, :user_id, :clave, :tipo, :cp)
    end
end
