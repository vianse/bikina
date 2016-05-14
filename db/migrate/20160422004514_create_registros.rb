class CreateRegistros < ActiveRecord::Migration
  def change
    create_table :registros do |t|
      t.string :titulo
      t.string :descripcion
      t.string :direccion
      t.string :telefono1
      t.string :correo
      t.string :sitioweb
      t.string :logo
      t.string :categoria
      t.string :costo
      t.string :user_id
      t.string :grupo_id
      t.integer  :countclicks
      t.timestamps null: false
    end
  end
end
