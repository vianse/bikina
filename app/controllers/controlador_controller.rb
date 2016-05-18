class ControladorController < ApplicationController
	
  def index
  	if user_signed_in?
  		@perfil = Perfil.where(:user_id => current_user.id).pluck(:id).first
  		if @perfil.blank?
  			redirect_to "/perfil"
  		else
  			@grupo = Unir.where(:user_id => current_user.id).pluck(:grupo_id).first
  			if @grupo.blank?
  				redirect_to "/comenzar"	
	  		else
				redirect_to "/registros?clave=" + @grupo + "&page=1"
	  		end

  		end
  		
  	else
  		redirect_to "/home/index"
  	end
  end
end
