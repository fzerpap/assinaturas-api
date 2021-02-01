class Empresa < ApplicationRecord
  belongs_to :country

  #has_many :users
  #has_many :bancos
  #has_many :caixa_pdvs
  #has_many :caixa_principals

  validates :nome, :cnpj, :cep, :country_id, presence: true


  before_destroy :safe_to_delete

  def safe_to_delete
    return true
    #return caixa_principals.any? ? false : true
  end

  def dia_inicio_saldo
    return data_inicio_saldo.to_date.nil? ? Date.today : data_inicio_saldo.to_date
  end

end
