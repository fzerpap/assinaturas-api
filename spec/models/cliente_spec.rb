require 'rails_helper'

RSpec.describe Cliente, type: :cliente do

  fixtures :clientes, :assinaturas, :modelos

  before(:each) do
     @modelo = modelos(:a20)
  end

  context 'Validacao de associacoes do modelo' do

    it 'Devería has_many :assinaturas' do
      cliente = clientes(:ym)
      assinaturas = cliente.assinaturas
      expect(assinaturas.count).to eql(1)

    end

  end
  context 'Validacao de atributos do modelo' do

    it 'Devería ser valido com todos os atributos e atributos aninhados da assinatura' do
     
      cliente = Cliente.new(nome: 'Antonio Parra Zerpa', cpf: '103769955557667390', email: 'aparra@gmail.com')
      cliente.assinaturas.build({imei: '817655669918990', preco_anual: 340.00, num_parcelas: 4, 
                  modelo_id: 25, data_emisao: Date.today, data_vencimento: Date.today+365})
      
      #lambda { cliente.save }.should change(Cliente, :count).by(1)  
      
      cliente.save    
      cliente.valid?.should be_truthy

    end

    it 'Devería ser valido com todos os atributos' do
      cliente = Cliente.create(nome: 'Benjamin Zerpa', cpf: '23987667854', email: 'bzerpa@gmail.com') 
      cliente.valid?.should be_truthy

    end

    it 'Nao devería ser valido com nome nulo' do
      cliente = Cliente.create(nome: nil, cpf: '43987667850', email: 'bparra@gmail.com') 
      cliente.valid?.should be_falsey
    end

    it 'Nao devería ser valido com nome nulo e cpf nula' do
      cliente = Cliente.create(nome: nil, cpf: nil, email: 'bparra@gmail.com') 
      cliente.valid?.should be_falsey
    end

    it 'Nao devería ser valido com nome, cpf e email nulo ' do
      cliente = Cliente.create(nome: nil, cpf: nil, email: nil) 
      cliente.valid?.should be_falsey
    end

    it 'Nao devería ser valido com cpf que já existe' do
      cliente = Cliente.create(nome: nil, cpf: '239856956847', email: 'pramirez@gmail.com') 
      cliente.valid?.should be_falsey
    end

    it 'Devería excluir o cliente' do
      cliente = clientes(:ym)
      cliente.destroy
      cliente.valid?.should be_truthy
    end

    it 'Nao devería excluir, viola a chave de integridad em assinaturas' do
      cliente = clientes(:fz)
      cliente.destroyed?.should be_falsey
    end


  end

end



