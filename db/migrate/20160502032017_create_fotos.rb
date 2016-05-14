class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.text :photo
      t.string :registro_id
      t.string :user_id
      t.string :grupo_id

      t.timestamps null: false
    end
  end
end
