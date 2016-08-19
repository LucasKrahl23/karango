class CreateUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :usuarios do |t|
      t.string :nome
      t.string :email
      t.string :senha
      t.date :cadastro_dt
      t.boolean :ativo_flag
      t.references :perfisusuario, foreign_key: true

      t.timestamps
    end
  end
end
