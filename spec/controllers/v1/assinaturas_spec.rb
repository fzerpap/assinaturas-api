require 'rails_helper'

describe Api::V1::AssinaturasController, type: :controller do
    fixtures :assinaturas, :clientes, :modelos

    before(:each) do
        @modelo = modelos(:a10)
        @cliente = clientes(:rm)
      end

    it 'Devería retornar ok (200) para a request valida, action: index' do
        get :index
        expect(response.status).to eql(200)
    end  

    it 'Devería retornar um json de assinaturas e a primeira deve ter um imei 123456789012345, action: index' do
        get :index
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('data')[0].fetch('attributes').fetch('imei')).to eql('123456789012345')
    end  

    it 'Deve retornar um json de Assinatura, action: show' do
        assinatura = assinaturas(:afz2)
        get :show, params: { id: assinatura.id }
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('data').fetch('id').to_i).to eql(assinatura.id)
    end   

    it 'Deve criar uma assinatura, action: create' do
        post :create, params: { "assinatura": { imei: "567898765456777", preco_anual: 240.40,
                                num_parcelas: 6, modelo: @modelo, cliente: @cliente,
                                data_emisao: Date.today, data_vencimento: Date.today+365 }}
        expect(response.status).to eql(201)
    end  

    it 'Deve excluir uma assinatura, action: destroy' do
        assinatura = assinaturas(:afz1)
        delete :destroy, params: { id: assinatura.id  }
        expect(response.status).to eql(200)

    end   
 
end

