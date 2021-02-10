require 'rails_helper'

RSpec.describe Modelo, type: :modelo do
  fixtures :modelos, :marcas, :assinaturas

  before(:each) do
    @marca = marcas(:samsung)
    @modelo = modelos(:a20)
  end
  
  context 'Validacao de associacoes do modelo' do

    it 'Devería has_many :assinaturas' do
      assinaturas = @modelo.assinaturas
      expect(assinaturas.count).to eql(2)

    end

    it 'Devería belongs_to :marca' do
      marca = @modelo.marca
      expect(marca.nome).to eql('Samsung')

    end

  end
  
  context 'Validacao de atributos do modelo' do

    it 'Devería ser valido com todos os atributos' do
      modelo = Modelo.create(nome: 'Galaxy Note', marca: @marca) 
      modelo.valid?.should be_truthy

    end

    it 'Nao devería ser valido com nome nulo' do
      modelo = Modelo.create(nome: nil, marca: @marca) 
      modelo.valid?.should be_falsey
    end

    it 'Nao devería ser valido com nome nulo e marca nula' do
      modelo = Modelo.create(nome: nil, marca: nil) 
      modelo.valid?.should be_falsey
    end

    it 'Nao devería ser valido com nome que já existe' do
      modelo = Modelo.create(nome: 'A20', marca: @marca) 
      modelo.valid?.should be_falsey
    end

    it 'Devería excluir o modelo' do
      modelo = modelos(:iphone4)
      modelo.destroy
      modelo.valid?.should be_truthy
    end

    it 'Nao devería excluir, viola a chave de integridad em assinaturas' do
      modelo = modelos(:a20)
      modelo.destroyed?.should be_falsey
    end

  end

end


