class AddColumnaToRegistro < ActiveRecord::Migration
  def change
    add_column :registros, :descripcionlarga, :text
  end
end
