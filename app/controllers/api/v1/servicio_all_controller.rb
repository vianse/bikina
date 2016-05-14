class Api::V1::ServicioAllController <ApplicationController
	def index
		servicios = Registro.select(:titulo, :descripcion,:user_id,:telefono1,:correo,:countclicks,:user_id,:id).where(:grupo_id => params[:clave]).paginate(:page => params[:page]).order('id DESC')
		servicio = servicios.map do |a|
			{
				:img => Perfil.where(:user_id => a.user_id).pluck(:photo).first,
				:titulo => a.titulo,
				:descripcion => a.descripcion,
				:telefono1 => a.telefono1,
				:correo => a.correo,
				:countclicks => a.countclicks,
				:user_id => a.user_id,
				:id  => a.id,
				:page => params[:page]
			}

		end
		render json: servicio
	end
end