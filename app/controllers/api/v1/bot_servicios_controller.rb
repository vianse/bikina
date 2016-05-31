class Api::V1::BotServiciosController <ApplicationController
	def index
		render json: '{"attachment":{"type":"template","payload":{"template_type":"generic","elements":[{"title":"Persistir\u00e1n lluvias en territorio salvadore\u00f1o","subtitle":"Pronostican que por la noche habr\u00e1&#160;chubascos y tormentas aisladas\n","image_url":"http:\/\/am-elsalv-cdn.agilecontents.com\/resources\/jpg\/6\/0\/1464698432006.jpg","buttons":[{"type":"web_url","url":"http:\/\/www.elsalvador.com\/\/articulo\/comunidades\/persistiran-lluvias-territorio-salvadoreno-114314","title":"Leer Noticia"},{"type":"postback","title":"Otra Busqueda","payload":"edhbusqueda"}]},{"title":"Los \u00e1rboles y su funci\u00f3n en la ecolog\u00eda","subtitle":"Se reduce el calor y se protegen mantos acu\u00edferos. Dos razones suficientes para tomar en serio la importancia de reforestar.\n","image_url":"http:\/\/am-elsalv-cdn.agilecontents.com\/resources\/jpg\/9\/2\/1464649099929.jpg","buttons":[{"type":"web_url","url":"http:\/\/www.elsalvador.com\/\/articulo\/comunidades\/los-arboles-funcion-ecologia-114277","title":"Leer Noticia"},{"type":"postback","title":"Otra Busqueda","payload":"edhbusqueda"}]},{"title":"Pocos clientes llegan a la nueva plaza en Ahuachap\u00e1n","subtitle":"&#160;Alcalde Abilio Flores se limita a recomendar a las personas que compren en el lugar y los otros mercados. Algunos vendedores est\u00e1n regresando a las calles.\n","image_url":"http:\/\/am-elsalv-cdn.agilecontents.com\/resources\/jpg\/5\/5\/1464649099955.jpg","buttons":[{"type":"web_url","url":"http:\/\/www.elsalvador.com\/\/articulo\/comunidades\/pocos-clientes-llegan-nueva-plaza-ahuachapan-114276","title":"Leer Noticia"},{"type":"postback","title":"Otra Busqueda","payload":"edhbusqueda"}]}]}}}'


		# if params[:q].present?
		# servicios = Registro.select(:titulo, :descripcion,:user_id,:telefono1,:correo,:countclicks, :user_id,:id).where("lower(descripcion) LIKE ?", "%#{params[:q.downcase]}%").where(:grupo_id => params[:clave]).paginate(:page => params[:page]).order('id DESC')
		# #if servicios.present?

		# servicio=servicios.map do |a|
		# 	{
		# 		:img => Perfil.where(:user_id => a.user_id).pluck(:photo).first,
		# 		:titulo => Perfil.where(:user_id => a.user_id).pluck(:nombre).first,
		# 		:descripcion => a.descripcion,
		# 		:telefono1 => a.telefono1,
		# 		:correo => a.correo,
		# 		:countclicks => a.countclicks,
		# 		:user_id => a.user_id,
		# 		:id  => a.id
		# 	}

		# end
		# render json: servicio

		#  else
		#  	servicios = Registro.select(:titulo, :descripcion,:user_id,:telefono1,:correo,:countclicks, :user_id,:id).where(:grupo_id => params[:clave]).paginate(:page => params[:page]).order('id DESC')
		# 	servicio=servicios.map do |a|
		# 	{
		# 		:img => Perfil.where(:user_id => a.user_id).pluck(:photo).first,
		# 		:titulo => Perfil.where(:user_id => a.user_id).pluck(:nombre).first,
		# 		:descripcion => a.descripcion,
		# 		:telefono1 => a.telefono1,
		# 		:correo => a.correo,
		# 		:countclicks => a.countclicks,
		# 		:user_id => a.user_id,
		# 		:id  => a.id
		# 	}

		# 	end
		# 	render json: servicio
		# #  	render json: [{
		# #  	:titulo => "No existen servicios con #{params[:q]}",
		# #  	:descripcion => ""
		# #  }]
		# #  end
		# #  else
		# # render json: [{
		# #  	:titulo => "Escribe un servicio valido",
		# #  	:descripcion => ""
		# #  }]
		#   end
		
	end
end
