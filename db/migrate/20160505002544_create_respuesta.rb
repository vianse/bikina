class CreateRespuesta < ActiveRecord::Migration
  def change
    create_table :respuesta do |t|
      t.string :respuesta
      t.string :comentario_id
      t.string :user_id
      t.string :grupo_id
      t.string :registro_id
      t.string :name_user
      t.timestamps null: false
    end
  end
end
