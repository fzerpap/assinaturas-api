

Assinatura.delete_all
Cliente.delete_all
Modelo.delete_all
Marca.delete_all


puts "INIT MARCAS"
samsung = Marca.create!(nome: 'Samsung')
lg = Marca.create!(nome: 'LG')
apple = Marca.create!(nome: 'Apple')

puts "INIT MODELOS"
a10 = Modelo.create!(nome: 'A10', marca: samsung)
a21 = Modelo.create!(nome: 'A21', marca: samsung)
iphone6 = Modelo.create!(nome: 'iPhone6', marca: apple)
iphone7 = Modelo.create!(nome: 'iPhone7', marca: apple)



puts "INIT CLIENTES"
c1    = Cliente.create!(nome: 'Francisco Zerpa', cpf: '239856956847', email: 'fzerpap@gmail.com')
c2    = Cliente.create!(nome: 'Yosely Molina', cpf: '239856954201', email: 'ymolina@gmail.com')
c3    = Cliente.create!(nome: 'Rebeca Molina', cpf: '239856956890', email: 'rmolina@gmail.com')

puts "INIT ASSINATURAS"
a1    = Assinatura.create!(imei: '123456789012345', preco_anual: 300.90, num_parcelas: 6, 
            modelo: a10,cliente: c1, data_emisao: '03/01/2021'.to_date, data_vencimento: '02/01/2022'.to_date)
a2    = Assinatura.create!(imei: '987456789012346', preco_anual: 290.00, num_parcelas: 4, 
        modelo: a21,cliente: c1, data_emisao: '05/01/2021'.to_date, data_vencimento: '05/01/2022'.to_date)
a3    = Assinatura.create!(imei: '123456789012347', preco_anual: 380.00, num_parcelas: 6, 
            modelo: iphone6,cliente: c2, data_emisao: '10/01/2021'.to_date, data_vencimento: '10/01/2022'.to_date)



