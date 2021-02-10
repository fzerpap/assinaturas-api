require 'rails_helper'

describe Api::V1::ClientesController, type: :controller do
    fixtures :clientes

    it 'Devería retornar ok (200) para a request valida, action: index' do
        get :index
        expect(response.status).to eql(200)
    end  

    it 'Devería retornar um json de clientes e o primeiro cliente deve ser Francisco Zerpa, action: index' do
        get :index
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('data')[0].fetch('attributes').fetch('nome')).to eql('Francisco Zerpa')
    end  

    it 'Deve retornar um json de Cliente, action: show' do
        cliente = clientes(:rm)
        get :show, params: { id: cliente.id }
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('data').fetch('id').to_i).to eql(cliente.id)
    end   

    it 'Deve criar um cliente, action: create' do
        post :create, params: { "cliente": { nome: "Ana Siva", cpf: '234565467', email: 'asilva@gmail.com' }}
        response_body = JSON.parse(response.body)
        expect(response.status).to eql(201)
    end  

    it 'Deve excluir um cliente, action: destroy' do
        cliente = clientes(:rm)
        delete :destroy, params: { id: cliente.id  }
        expect(response.status).to eql(200)

    end   
 
end

