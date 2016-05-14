class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string :comentario
      t.string :user_id
      t.string :grupo_id
      t.string :registro_id
      t.string :name_user
      t.timestamps null: false
    end
  end
end
