class Api::V1::GetRespuestasController <ApplicationController
	def index
		@respuestas = Respuestum.where(:comentario_id => params[:id])

		respuesta = @respuestas.map do |k|
			{
				:id => k.id,
				:respuesta => k.respuesta,
				:name_user => k.name_user,
				:photo => Perfil.where(:user_id => k.user_id).pluck(:photo)
			}
		end

		render json: respuesta


	end
end