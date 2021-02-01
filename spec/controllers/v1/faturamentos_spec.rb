require 'rails_helper'

describe Api::V1::FaturamentosController, type: :controller do
    it 'Deve retornar ok (200) para a request valida, action: index' do
        get :index
        expect(response.status).to eql(200)
    end  
    it 'Deve retornar um json de faturamentos e o primeiro deve ter um valor de 50000, action: index' do
        get :index
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('data')[0].fetch('valor')).to eql(20000).to_s

    end  
    it 'Deve retornar um json de Faturamento, action: show' do
        faturamento = Faturamento.first
        get :show, params: { id: faturamento.id }
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('data').fetch('id')).to eql(faturamento.id)
    end   
    it 'Deve excluir um faturamento, action: destroy' do
        faturamento = Faturamento.last
        delete :destroy, params: { id: faturamento.id  }
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('message')).to eql('Faturamento Destroyed')
    end   

    it 'Deve retornar uma menssagem: faturamento Created, action: create' do
        empresa = Empresa.first
        post :create, params: { "faturamento": { data: Date.today-4, empresa_id: empresa.id }}
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('message')).to eql('Faturamento Created')
    end  
    
     
    it 'Deve retornar uma menssagem: faturamento Updated, action: update' do
        faturamento = Faturamento.first
        put :update, params: { id: faturamento.id, "faturamento": { valor: 1500 }}
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('message')).to eql('Faturamento Updated')
    end  
end

