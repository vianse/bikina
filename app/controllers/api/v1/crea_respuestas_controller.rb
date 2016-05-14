class Api::V1::CrearRespuestasController <ApplicationController
 skip_before_filter :verify_authenticity_token
 def index
 	
  
 end
 def create
       @crear_respuesta = Respuestum.create({
        :respuesta => params[:respuesta], 
        :comentario_id => params[:comentario_id], 
        :user_id => current_user.id, 
        :grupo_id => params[:comentario_id], 
        :registro_id => params[:comentario_id]
        })
        render json: {
           message: "Datos guardados satisfactoriamente."
         }
 end
 private
  def facturas_params
   params.require(:respuestum).map do |p|
   ActionController::Parameters.new(p.to_hash).permit(:respuesta, :comentario_id, :user_id, :grupo_id, :registro_id)
   end
  end
end