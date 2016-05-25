class Grupo < ActiveRecord::Base
before_save :default_values
has_many :registros
	def default_values
      if self.id.nil?
        self.publicado = "Pendiente"
        self.tipo = "Publico"
      else
      end
  	end
  	def paypal_url(return_path)
  	valor = id + clave.to_i
    name = nombre
    values = {
      :business => 'negocio-1@vianse.mx',
      :upload => 1,
      :no_shipping => 1,
      :return => "#{Rails.application.secrets.app_host}#{return_path}",
      :notify_url => "#{Rails.application.secrets.app_host}/hook",
      :invoice => valor,
      :currency_code => 'USD',
      :item_name => name,
    }
    values.merge!({
         cmd:'_xclick-subscriptions',
         a3: 10,
         p3: 1,
         srt: 12,
         t3:  "Month",

      })


 
    # values.merge!({
    #                 cmd: "",
    #                 a3: price,
    #                 p3: 1,
    #                 srt: cycles,
    #                 t3: period.first
    #            })

              

    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
end
