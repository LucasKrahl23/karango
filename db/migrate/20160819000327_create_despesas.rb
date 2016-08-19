class CreateDespesas < ActiveRecord::Migration[5.0]
  def change
    create_table :despesas do |t|
      t.string :descricao
      t.date :despesa_dt
      t.numeric :valor
      t.references :formaspagamento, foreign_key: true
      t.references :veiculo, foreign_key: true
      t.string :obs

      t.timestamps
    end
  end
end
