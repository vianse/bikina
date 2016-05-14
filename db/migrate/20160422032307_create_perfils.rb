class CreatePerfils < ActiveRecord::Migration
  def change
    create_table :perfils do |t|
      t.string :nombre
      t.string :cp
      t.string :colonio
      t.string :user_id
      t.text :photo

      t.timestamps null: false
    end
  end
end
