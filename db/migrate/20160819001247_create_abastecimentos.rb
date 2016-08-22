class CreateAbastecimentos < ActiveRecord::Migration[5.0]
  def change
    create_table :abastecimentos do |t|
      t.date :abastecimento_dt
      t.integer :odometro
      t.numeric :precolitro
      t.numeric :precototal
      t.string :obs
      t.references :veiculo, foreign_key: true
      t.boolean :completou_flag
      t.references :combustivel, foreign_key: true
      t.references :formaspagamento, foreign_key: true

      t.timestamps
    end
  end
end
