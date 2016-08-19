class CreateFormaspagamentos < ActiveRecord::Migration[5.0]
  def change
    create_table :formaspagamentos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
