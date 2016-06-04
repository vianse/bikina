class Api::V1::ServicioAllController <ApplicationController
	def index
		servicios = Registro.select(:titulo, :descripcion,:user_id,:telefono1,:correo,:countclicks,:user_id,:id,:recomendado).where(:grupo_id => params[:clave])
		servicio = servicios.map do |a|
			@url ="http://dummyimage.com/600x400/380f38/ffffff&text=b"
			if a.recomendado=="si"
				{
					:img => @url,
					:titulo => a.titulo,
					:descripcion => a.descripcion,
					:telefono1 => a.telefono1,
					:correo => a.correo,
					:countclicks => a.countclicks,
					:user_id => a.user_id,
					:id  => a.id,
					:page => params[:page],
					:recomendado => a.recomendado


				}
			else
				{
					:img => Perfil.where(:user_id => a.user_id).pluck(:photo).first,
					:titulo => Perfil.where(:user_id => a.user_id).pluck(:nombre).first,
					:descripcion => a.descripcion,
					:telefono1 => a.telefono1,
					:correo => a.correo,
					:countclicks => a.countclicks,
					:user_id => a.user_id,
					:id  => a.id,
					:page => params[:page],
					:recomendado => a.recomendado
				}
			end
		end
		render json: servicio
	end
end