class CreateEmpresas < ActiveRecord::Migration[5.0]
  def change
    create_table :empresas do |t|
      t.string :nome
      t.string :cnpj
      t.string :cep
      t.decimal :caixa_principal_saldo, scale: 2, precision: 10, default: 0.0
      t.decimal :caixa_troco_saldo, scale: 2, precision: 10, default: 0.0
      t.date :data_inicio_saldo
      t.references :country, foreign_key: true

      t.timestamps
    end
  end
end
