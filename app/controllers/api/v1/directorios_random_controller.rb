class Api::V1::DirectoriosRandomController <ApplicationController
	def index

		@unir = Unir.where(:user_id => current_user.id).pluck(:grupo_id)
		directorios = Grupo.select(:nombre, :clave).where(:publicado => "1").where.not(:clave => @unir).order("RANDOM()").limit(20)
		render json: directorios
		
	end
end
