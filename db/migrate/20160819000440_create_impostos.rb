class CreateImpostos < ActiveRecord::Migration[5.0]
  def change
    create_table :impostos do |t|
      t.string :descricao
      t.numeric :valor
      t.date :vencimento_dt
      t.string :obs
      t.boolean :pago_flag
      t.references :formaspagamento, foreign_key: true
      t.references :veiculo, foreign_key: true

      t.timestamps
    end
  end
end
