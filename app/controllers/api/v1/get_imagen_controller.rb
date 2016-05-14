class Api::V1::GetImagenController <ApplicationController
	def index
		@Imagenes = Foto.where(:registro_id => params[:id])
		render json: @Imagenes
	end
end
