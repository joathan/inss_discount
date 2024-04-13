class CreateContacts < ActiveRecord::Migration[7.1]
  def change
    create_table :contacts do |t|
      t.string :phone
      t.integer :kind
      t.references :proponent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
