class Api::V1::GetComentariosController <ApplicationController
	def index
		@comentarios = Comentario.where(:registro_id => params[:id]).order(id: :desc)
		comentario = @comentarios.map do |k|
			{
				:id => k.id,
				:comentario => k.comentario,
				:name_user => k.name_user,
				:photo => Perfil.where(:user_id => k.user_id).pluck(:photo)
			}
		end
		render json: comentario
	end
end
