class Api::V1::GetDirectController <ApplicationController
	def index

		@busca = Unir.where(:user_id => current_user.id).pluck(:grupo_id)
		@directorios = Grupo.select(:nombre, :clave).where(:clave => @busca)

		directorio = @directorios.map do |k|
			{
				:id => k.id,
				:nombre => k.nombre,
				:clave => k.clave,
				:conteo => Unir.where(:grupo_id => k.clave).count
			}
		end
		render json: directorio
	end
end
