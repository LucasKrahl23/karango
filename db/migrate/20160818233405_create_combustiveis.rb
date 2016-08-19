class CreateCombustiveis < ActiveRecord::Migration[5.0]
  def change
    create_table :combustiveis do |t|
      t.string :nome

      t.timestamps
    end
  end
end
