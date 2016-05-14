class Foto < ActiveRecord::Base
	mount_uploader :photo, ImagenUploader
end
