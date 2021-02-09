class CreateAssinaturas < ActiveRecord::Migration[5.0]
  def change
    create_table :assinaturas do |t|
      t.string :imei
      t.decimal :preco_anual, scale: 2, precision: 10, default: 0.0
      t.integer :num_parcelas
      t.references :modelo, foreign_key: true
      t.references :cliente, foreign_key: true

      t.timestamps
    end
  end
end
