class CreateUnirs < ActiveRecord::Migration
  def change
    create_table :unirs do |t|
      t.string :grupo_id
      t.string :user_id

      t.timestamps null: false
    end
  end
end
