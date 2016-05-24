class RespuestaController < ApplicationController
  before_action :set_respuestum, only: [:show, :edit, :update, :destroy]

  # GET /respuesta
  # GET /respuesta.json
  def index
    @respuesta = Respuestum.all
  end

  # GET /respuesta/1
  # GET /respuesta/1.json
  def show
  end

  # GET /respuesta/new
  def new
    @respuestum = Respuestum.new
  end

  # GET /respuesta/1/edit
  def edit
  end

  # POST /respuesta
  # POST /respuesta.json
  def create
    @respuestum = Respuestum.new(respuestum_params)

    respond_to do |format|
      if @respuestum.save

        # @user = Comentario.where(:id => respuestum_params[:comentario_id]).pluck(:user_id).first
        # @email= User.where(:id => @user).pluck(:email)
        #   RestClient.post "https://api:key-e7d79c66e74391fdf48b657624f23ddc"\
        # "@api.mailgun.net/v3/sandboxb9c2dadab0ea49f6b7130d1091646c59.mailgun.org/messages",
        # :from => "Bikina <no-reply@bikina.mx>",
        # :to => @email,
        # :subject => "Has recibido una respuesta sobre la pregunta que realizaste",
        # :html => "<p>El usuario #{current_user.email} ha respondido la pregunta que le realizaste: </p>"\
        #          "<p>#{respuestum_params[:respuesta]}.</p>"\
        #          "<p>Entra a Bikina y sigue preguntando</p>"\
        #          "<span>Atte. Bikina team</span>"
        format.html { redirect_to :back, notice: 'Respuestum was successfully created.' }
        format.json { render :show, status: :created, location: @respuestum }
      else
        format.html { render :new }
        format.json { render json: @respuestum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /respuesta/1
  # PATCH/PUT /respuesta/1.json
  def update
    respond_to do |format|
      if @respuestum.update(respuestum_params)
        format.html { redirect_to @respuestum, notice: 'Respuestum was successfully updated.' }
        format.json { render :show, status: :ok, location: @respuestum }
      else
        format.html { render :edit }
        format.json { render json: @respuestum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /respuesta/1
  # DELETE /respuesta/1.json
  def destroy
    @respuestum.destroy
    respond_to do |format|
      format.html { redirect_to respuesta_url, notice: 'Respuestum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_respuestum
      @respuestum = Respuestum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def respuestum_params
      params.require(:respuestum).permit(:respuesta, :comentario_id, :user_id, :grupo_id, :registro_id,:name_user)
    end
end
