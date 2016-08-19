class CreateVeiculos < ActiveRecord::Migration[5.0]
  def change
    create_table :veiculos do |t|
      t.string :nome
      t.string :placa
      t.references :usuario, foreign_key: true
      t.references :marca, foreign_key: true
      t.references :tiposveiculo, foreign_key: true

      t.timestamps
    end
  end
end
