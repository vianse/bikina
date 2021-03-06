class Api::V1::DirectoriosRandomController <ApplicationController
	def index

		@unir = Unir.where(:user_id => current_user.id).pluck(:grupo_id)
		@cp = Perfil.where(:user_id => current_user.id).pluck(:cp)
		directorios = Grupo.select(:nombre, :clave,:tipo).where(:publicado => "1").where.not(:clave => @unir).where(:cp => @cp).order("RANDOM()").limit(20)
		render json: directorios
		
	end
end
