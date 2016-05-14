class Perfil < ActiveRecord::Base
	mount_uploader :photo, ImagenUploader
end
