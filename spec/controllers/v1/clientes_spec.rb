require 'rails_helper'

describe Api::V1::ClientesController, type: :controller do
    fixtures :clientes

    it 'Devería retornar ok (200) para a request valida, action: index' do
        get :index
        expect(response.status).to eql(200)
    end  


    it 'Deve retornar um json de Cliente, action: show' do
        cliente = clientes(:rm)
        get :show, params: { id: cliente.id }
        expect(response.status).to eql(200)
    end   

    it 'Deve retornar uma mensagem: ID do cliente nao existe, action: show' do
        get :show, params: { id: 99999999 }
        expect(response.status).to eql(422)
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

    it 'Deve retornar uma mensagem: ID do cliente nao existe, action: destroy' do
        delete :destroy, params: { id: 999999999  }
        expect(response.status).to eql(422)
    end   

end

