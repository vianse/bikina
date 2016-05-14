class CreateMegusta < ActiveRecord::Migration
  def change
    create_table :megusta do |t|
      t.string :megusta
      t.string :user_id
      t.string :grupo_id
      t.string :registro_id

      t.timestamps null: false
    end
  end
end
