
Language.delete_all
Currency.delete_all
Empresa.delete_all
Country.delete_all






puts "INIT CURRENCY"
dolar = Currency.create!(name: 'Dólar')
pesom =  Currency.create!(name: 'Peso mexicano')
pesoc =  Currency.create!(name: 'Peso colombiando')
real =  Currency.create!(name: 'Real')
euro =  Currency.create!(name: 'Euro')


puts "INIT LANGUAGE"
es = Language.create!(name: 'Español')
en = Language.create!(name: 'English')
pt = Language.create!(name: 'Portugues')

puts "INIT COUNTRIES"
brasil    = Country.create!(name: 'Brasil', currency: real, language: pt)
mexico    = Country.create!(name: 'Mexico', currency: pesom, language: es)
Colombia = Country.create!(name: 'Colombia', currency: pesoc, language: es)
usa   = Country.create!(name: 'USA', currency: dolar, language: en)



puts "INIT EMPRESAS"
mega_bom = Empresa.create!(nome: 'Mercado Mega Bom',cnpj: '34.322.124/0001-05',cep: '14.020-210',country: brasil )


