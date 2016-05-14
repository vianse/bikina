class Api::V1::GetMegustaController <ApplicationController
	def index
		@likes = Megustum.where(:registro_id => params[:id]).count
		render json: @likes
	end
end