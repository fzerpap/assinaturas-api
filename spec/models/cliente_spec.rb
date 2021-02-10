require 'rails_helper'

RSpec.describe Cliente, type: :cliente do
  fixtures :clientes

  context 'Validacao do cliente' do

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



