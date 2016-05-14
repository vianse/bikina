class Api::V1::ServiciosController <ApplicationController
	def index
		if params[:q].present?
		servicios = Registro.select(:titulo, :descripcion,:user_id,:telefono1,:correo,:countclicks, :user_id,:id).where("lower(descripcion) LIKE ?", "%#{params[:q.downcase]}%").where(:grupo_id => params[:clave]).paginate(:page => params[:page]).order('id DESC')
		#if servicios.present?

		servicio=servicios.map do |a|
			{
				:img => Perfil.where(:user_id => a.user_id).pluck(:photo).first,
				:titulo => a.titulo,
				:descripcion => a.descripcion,
				:telefono1 => a.telefono1,
				:correo => a.correo,
				:countclicks => a.countclicks,
				:user_id => a.user_id,
				:id  => a.id
			}

		end
		render json: servicio

		 else
		 	servicios = Registro.select(:titulo, :descripcion,:user_id,:telefono1,:correo,:countclicks, :user_id,:id).where(:grupo_id => params[:clave]).paginate(:page => params[:page]).order('id DESC')
			servicio=servicios.map do |a|
			{
				:img => Perfil.where(:user_id => a.user_id).pluck(:photo).first,
				:titulo => a.titulo,
				:descripcion => a.descripcion,
				:telefono1 => a.telefono1,
				:correo => a.correo,
				:countclicks => a.countclicks,
				:user_id => a.user_id,
				:id  => a.id
			}

			end
			render json: servicio
		#  	render json: [{
		#  	:titulo => "No existen servicios con #{params[:q]}",
		#  	:descripcion => ""
		#  }]
		#  end
		#  else
		# render json: [{
		#  	:titulo => "Escribe un servicio valido",
		#  	:descripcion => ""
		#  }]
		  end
		
	end
end
