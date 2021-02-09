class Cliente < ApplicationRecord
  has_many :assinaturas

  validates :nome, :cpf, :email, presence: true
  validates :cpf, uniqueness: true

  before_destroy :safe_to_delete

  def safe_to_delete
    return assinaturas.any? ? false : true
  end
end
