class Assinatura < ApplicationRecord
  belongs_to :modelo
  belongs_to :cliente

  validates :imei, :preco_anual, :num_parcelas, :modelo_id, :cliente_id, 
            :data_emisao, :data_vencimento, presence: true
  validates :imei, uniqueness: true

  before_destroy :safe_to_delete

  def safe_to_delete
    return assinaturas.any? ? false : true
  end
end
