class AddAttStatusToAssinatura < ActiveRecord::Migration[5.0]
  def change
    add_column :assinaturas, :status, :integer, default: 0
  end
end
