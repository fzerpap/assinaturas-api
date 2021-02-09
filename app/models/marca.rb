class Marca < ApplicationRecord
    has_many :modelos

    validates :nome, presence: true
    validates :nome, uniqueness: true

    before_destroy :safe_to_delete

    def safe_to_delete
        return modelos.any? ? false : true
    end
end
