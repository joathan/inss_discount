class CreateProponents < ActiveRecord::Migration[7.1]
  def change
    create_table :proponents do |t|
      t.string :name
      t.string :cpf
      t.jsonb :address
      t.integer :salary
      t.integer :inss_discount

      t.timestamps
    end
  end
end
