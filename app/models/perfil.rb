class Perfil < ActiveRecord::Base
	mount_uploader :photo, ImagenUploader

	def to_param

		"#{id} #{nombre}".parameterize
	end
end
