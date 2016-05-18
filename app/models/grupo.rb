class Grupo < ActiveRecord::Base
before_save :default_values
	def default_values
      if self.id.nil?
        self.publicado = "Pendiente"
        self.tipo = "Publico"
      else
      end
  end
end
