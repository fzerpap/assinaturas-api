require 'rails_helper'

RSpec.describe Marca, type: :marca do
  fixtures :marcas, :modelos
  
  context 'Validacao do modelo' do

    it 'Devería ser valido com todos os atributos' do
      marca = Marca.create(nome: 'Sony') 
      marca.valid?.should be_truthy

    end

    it 'Nao devería ser valido com nome nulo' do
      marca = Marca.create(nome: nil) 
      marca.valid?.should be_falsey
    end

    it 'Nao devería ser valido com nome que já existe' do
      marca = Marca.create(nome: 'Samsung') 
      marca.valid?.should be_falsey
    end

    it 'Devería excluir a marca' do
      marca = marcas(:huawei)
      marca.destroy
      marca.valid?.should be_truthy
    end

    it 'Nao devería excluir, viola a chave de integridad em modelos' do
      marca = Marca.find_by_nome('Samsung')
      marca.destroyed?.should be_falsey
    end

  end

end

