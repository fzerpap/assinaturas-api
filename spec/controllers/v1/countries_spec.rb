require 'rails_helper'

describe Api::V1::CountriesController, type: :controller do
    it 'Deve retornar ok (200) para a request valida, action: index' do
        get :index
        expect(response.status).to eql(200)
    end  
    it 'Deve retornar um json de countries e o primeiro country deve ser Brasil, action: index' do
        get :index
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('data')[0].fetch('name')).to eql('Brasil')

    end  
    it 'Deve retornar um json de Country, action: show' do
        country = Country.first
        get :show, params: { id: 1 }
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('data').fetch('id')).to eql(country.id)
    end   
    it 'Deve excluir um country, action: destroy' do
        country = Country.last
        delete :destroy, params: { id: country.id  }
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('message')).to eql('Country Destroyed')
    end   

    it 'Deve retornar uma menssagem: Country Created, action: create' do
        currency = Currency.last
        language = Language.last
        post :create, params: { "country": { name: "Venezuela", currency_id: currency.id, language_id: language.id }}
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('message')).to eql('Country Created')
    end  
    
     
    it 'Deve retornar uma menssagem: Country Updated, action: update' do
        country = Country.where(name: 'Brasil').first
        put :update, params: { id: country.id, "country": { name: "Republica do Brasil" }}
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('message')).to eql('Country Updated')
    end  
end

