class CreateManutencoes < ActiveRecord::Migration[5.0]
  def change
    create_table :manutencoes do |t|
      t.string :descricao
      t.integer :odometro
      t.date :manutencao_dt
      t.numeric :valor
      t.date :validade_dt
      t.integer :kmvalidade
      t.string :obs
      t.references :formaspagamento, foreign_key: true
      t.references :veiculo, foreign_key: true

      t.timestamps
    end
  end
end
