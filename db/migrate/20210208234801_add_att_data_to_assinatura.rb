class AddAttDataToAssinatura < ActiveRecord::Migration[5.0]
  def change
    add_column :assinaturas, :data_emisao, :date
    add_column :assinaturas, :data_vencimento, :date
  end
end
