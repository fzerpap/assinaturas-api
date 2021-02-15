require 'rails_helper'

describe Api::V1::MarcasController, type: :controller do
    fixtures :marcas

    it 'Devería retornar ok (200) para a request valida, action: index' do
        get :index
        expect(response.status).to eql(200)
    end  

    it 'Deve retornar um json de Marca, action: show' do
        marca = marcas(:lg)
        get :show, params: { id: marca.id }
        expect(response.status).to eql(200)
    end   

    it 'Deve criar um marca, action: create' do
        post :create, params: { "marca": { nome: "Sony" }}
        expect(response.status).to eql(201)

    end  

    it 'Deve excluir um marca, action: destroy' do
        marca = marcas(:huawei)
        delete :destroy, params: { id: marca.id  }
        expect(response.status).to eql(200)

    end   
 
end

