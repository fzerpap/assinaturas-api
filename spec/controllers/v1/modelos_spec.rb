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


    it 'Deve retornar um json de Modelo, action: show' do
        modelo = modelos(:a20)
        get :show, params: { id: modelo.id }
        expect(response.status).to eql(200)
     end   

    it 'Deve retornar um json de Modelos para una marca, action: show' do
        marca = marcas(:samsung)
        get :show, params: { marca_id: marca.id }
        expect(response.status).to eql(200)
     end   

    it 'Deve criar um modelo, action: create' do
        post :create, params: { "modelo": { nome: "Galaxy Note", marca_id: @marca.id}}
        expect(response.status).to eql(201)
     end  

    it 'Deve excluir um modelo, action: destroy' do
        modelo = modelos(:galaxy_on)
        delete :destroy, params: { id: modelo.id  }
        expect(response.status).to eql(200)

    end   
 
end

