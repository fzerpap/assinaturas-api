class Country < ApplicationRecord
  belongs_to :currency
  belongs_to :language
  has_many :empresas
  

  validates :name, :currency_id, :language_id, presence: true
  validates :name, uniqueness: true

  before_destroy :safe_to_delete

  def safe_to_delete
    return empresas.any? ? false : true
  end
end
