class Currency < ApplicationRecord
    has_many :countries

    validates :name, presence: true
    validates :name, uniqueness: true
  
    before_destroy :confirm_presence_of_countries
  
    def safe_to_delete
      return countries.any? ? false : true
    end
end
