class CreateCps < ActiveRecord::Migration
  def change
    create_table :cps do |t|
      t.string :codigo
      t.string :asentamiento
      t.string :tipoAsentamiento
      t.string :municipio
      t.string :estado

      t.timestamps null: false
    end
  end
end
