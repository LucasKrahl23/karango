class CreateTiposveiculos < ActiveRecord::Migration[5.0]
  def change
    create_table :tiposveiculos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
