require 'rails_helper'

describe Api::V1::MarcasController, type: :controller do
    fixtures :marcas

    it 'Devería retornar ok (200) para a request valida, action: index' do
        get :index
        expect(response.status).to eql(200)
    end  

    it 'Devería retornar um json de marcas e o primeiro marca deve ser Samsung, action: index' do
        get :index
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('data')[0].fetch('attributes').fetch('nome')).to eql('Samsung')
    end  

    it 'Deve retornar um json de Marca, action: show' do
        marca = marcas(:lg)
        get :show, params: { id: marca.id }
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('data').fetch('id').to_i).to eql(marca.id)
    end   

    it 'Deve criar um marca, action: create' do
        post :create, params: { "marca": { nome: "Sony" }}
        response_body = JSON.parse(response.body)
        expect(response.status).to eql(201)
    end  

    it 'Deve excluir um marca, action: destroy' do
        marca = marcas(:huawei)
        delete :destroy, params: { id: marca.id  }
        expect(response.status).to eql(200)

    end   
 
end

