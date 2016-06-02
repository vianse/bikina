class AddColumnPropioToRegistro < ActiveRecord::Migration
  def change
    add_column :registros, :recomendado, :string
  end
end
