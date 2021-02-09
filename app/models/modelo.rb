class Modelo < ApplicationRecord
  belongs_to :marca

  has_many :assinaturas

  validates :nome, :marca_id, presence: true
  validates :nome, uniqueness: true

  before_destroy :safe_to_delete

  def safe_to_delete
      return assinaturas.any? ? false : true
  end
end
