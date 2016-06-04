class Api::V1::DirectoriosController <ApplicationController
	def index
		if params[:q].present?
		@unir = Unir.where(:user_id => current_user.id).pluck(:grupo_id)

		directorios = Grupo.select(:nombre, :clave).where("lower(nombre) LIKE ?", "%#{params[:q.downcase]}%").where(:publicado => "1").where(:cp => Perfil.where(:user_id => current_user.id).pluck(:cp).first).where.not(:clave => @unir)
		
		if directorios.present?
		render json: directorios
		else
			render json: [{
			:nombre => "No existen directorios con #{params[:q]}",
			:clave => ""
		}]
		end
		else
		render json: [{
			:nombre => "Escribe un directorio valido",
			:clave => ""
		}]
		end
		
	end
end
