require 'rails_helper'

describe Api::V1::ModelosController, type: :controller do
    fixtures :modelos, :marcas

    before(:each) do
        @marca = marcas(:samsung)
    end

    it 'Devería retornar ok (200) para a request valida, action: index' do
        get :index
        expect(response.status).to eql(200)
    end  

    it 'Devería retornar um json de modelos e o primeiro modelo deve ser A10, action: index' do
        get :index
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('data')[0].fetch('attributes').fetch('nome')).to eql('A10')
    end  

    it 'Deve retornar um json de Modelo, action: show' do
        modelo = modelos(:a20)
        get :show, params: { id: modelo.id }
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('data').fetch('id').to_i).to eql(modelo.id)
    end   

    it 'Deve criar um modelo, action: create' do
        post :create, params: { "modelo": { nome: "Galaxy Note", marca: @marca}}
        response_body = JSON.parse(response.body)
        expect(response.status).to eql(201)
    end  

    it 'Deve excluir um modelo, action: destroy' do
        modelo = modelos(:galaxy_on)
        delete :destroy, params: { id: modelo.id  }
        expect(response.status).to eql(200)

    end   
 
end

