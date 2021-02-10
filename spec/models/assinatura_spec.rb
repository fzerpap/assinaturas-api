require 'rails_helper'

RSpec.describe Assinatura, type: :assinatura do
  fixtures :assinaturas, :modelos, :clientes

  before(:each) do
    @cliente = clientes(:rm)
    @modelo = modelos(:iphone6)
  end

  context 'Validacao do assinatura' do

    it 'Devería ser valido com todos os atributos' do
      assinatura = Assinatura.create(imei: '543210123456789', preco_anual: 340.00, num_parcelas: 4, 
                                    modelo: @modelo, cliente: @cliente, data_emisao: Date.today, 
                                    data_vencimento: Date.today+365) 
      assinatura.valid?.should be_truthy

    end

    it 'Nao devería ser valido com imei nulo' do
      assinatura = Assinatura.create(imei: nil, preco_anual: 340.00, num_parcelas: 4, 
        modelo: @modelo, cliente: @cliente, data_emisao: Date.today, 
        data_vencimento: Date.today+365) 

      assinatura.valid?.should be_falsey
    end

    it 'Nao devería ser valido com imei, preco_anual nulo' do
      assinatura = Assinatura.create(imei: nil, preco_anual: nil, num_parcelas: 4, 
        modelo: @modelo,cliente: @cliente, data_emisao: Date.today, 
        data_vencimento: Date.today+365) 
      assinatura.valid?.should be_falsey
    end

    it 'Nao devería ser valido com imei, preco_anual, modelo, assinatura e datas nulas ' do
      assinatura = Assinatura.create(imei: nil, preco_anual: nil, num_parcelas: 4, 
        modelo: nil, cliente: nil, data_emisao: nil, data_vencimento: nil) 
      assinatura.valid?.should be_falsey
    end

    it 'Nao devería ser valido com imei que já existe' do
      assinatura = Assinatura.create(imei: '123456789012345', preco_anual: 340.00, num_parcelas: 4, 
        modelo: @modelo, cliente: @cliente, data_emisao: Date.today, 
        data_vencimento: Date.today+365) 
      assinatura.valid?.should be_falsey
    end


  end

end
