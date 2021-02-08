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

  #def as_json(options={})
  #  super(root: true,
  #        methods: [:author, :language_name, :currency_name] )
  #end

  #def as_json(options={})
  #  super(root: true,
  #        include: { language: {only: [:id, :name] }},
  #        include: { currency: {only: [:id, :name] }},
  #        methods: :author )
  #end

  def author
    "Francisco Zerpa"
  end
  def language_name
    self.language.name
  end

  def currency_name
    self.currency.name
  end



end
