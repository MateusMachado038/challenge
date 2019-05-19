class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.decimal :sendd
      t.decimal :receivee
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
