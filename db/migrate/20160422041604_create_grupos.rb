class CreateGrupos < ActiveRecord::Migration
  def change
    create_table :grupos do |t|
      t.string :nombre
      t.string :descripcion
      t.string :user_id
      t.string :clave
      t.string :publicado
      t.timestamps null: false
    end
  end
end
