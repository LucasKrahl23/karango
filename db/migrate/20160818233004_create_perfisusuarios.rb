class CreatePerfisusuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :perfisusuarios do |t|
      t.string :nome
      t.boolean :admin_flag

      t.timestamps
    end
  end
end
