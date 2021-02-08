class CountrySerializer
  include FastJsonapi::ObjectSerializer
  
  attributes :name

  belongs_to :currency, serializer: CurrencySerializer
  belongs_to :language, serializer: LanguageSerializer
  
meta do
  {author: 'Francisco Zerpa'}
end

end
