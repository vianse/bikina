class Registro < ActiveRecord::Base
	before_save :default_values
	self.per_page = 20
	def to_param

		"#{id} #{titulo}".parameterize
	end


  def default_values
      if self.id.nil?
        self.countclicks = 0
      else
      end
  end
	
end
