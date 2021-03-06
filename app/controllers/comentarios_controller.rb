class ComentariosController < ApplicationController
  before_action :set_comentario, only: [:show, :edit, :update, :destroy]

  # GET /comentarios
  # GET /comentarios.json
  def index
    @comentarios = Comentario.all
  end

  # GET /comentarios/1
  # GET /comentarios/1.json
  def show
  end

  # GET /comentarios/new
  def new
    @comentario = Comentario.new
  end

  # GET /comentarios/1/edit
  def edit
  end

  # POST /comentarios
  # POST /comentarios.json
  def create
    @comentario = Comentario.new(comentario_params)

    respond_to do |format|
      if @comentario.save
        @user = Registro.where(:id => comentario_params[:registro_id]).pluck(:user_id).first
        @email= User.where(:id => @user).pluck(:email)
          RestClient.post "https://api:key-e7d79c66e74391fdf48b657624f23ddc"\
        "@api.mailgun.net/v3/sandboxb9c2dadab0ea49f6b7130d1091646c59.mailgun.org/messages",
        :from => "Bikina <no-reply@bikina.mx>",
        :to => @email,
        :subject => "Has recibido un comentario sobre tu producto",
        :html => "<p>El usuario #{current_user.email} te ha preguntado lo siguiente:</p>"\
                 "<p>#{comentario_params[:comentario]}.</p>"\
                 "<p>Entra a Bikina y responde su mensaje</p>"\
                 "<span>Atte. Bikina team</span>"
                 
        format.html { redirect_to :back, notice: 'Comentario was successfully created.' }
        format.json { render :show, status: :created, location: @comentario }
      else
        format.html { render :new }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comentarios/1
  # PATCH/PUT /comentarios/1.json
  def update
    respond_to do |format|
      if @comentario.update(comentario_params)
        format.html { redirect_to @comentario, notice: 'Comentario was successfully updated.' }
        format.json { render :show, status: :ok, location: @comentario }
      else
        format.html { render :edit }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    @comentario.destroy
    respond_to do |format|
      format.html { redirect_to comentarios_url, notice: 'Comentario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comentario_params
      params.require(:comentario).permit(:comentario, :user_id, :grupo_id, :registro_id,:name_user)
    end
end
