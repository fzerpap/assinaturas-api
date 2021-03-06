class Assinatura < ApplicationRecord
  belongs_to :modelo
  #belongs_to :cliente, optional: true
  belongs_to :cliente
  

  enum status: [:ativa, :cancelada, :vencida]

  validates :imei, :preco_anual, :num_parcelas, :modelo_id, :data_emisao, :data_vencimento, presence: true
   
  before_destroy :safe_to_delete

  def safe_to_delete
    return Date.today > data_vencimento ? true : false
  end

  def self.valid_status
    %w[ativa cancelada vencida]
  end
end
