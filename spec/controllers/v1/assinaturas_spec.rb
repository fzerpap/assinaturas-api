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

    it 'Deve retornar um json de Assinatura, action: show' do
        assinatura = assinaturas(:afz2)
        get :show, params: { id: assinatura.id }
        expect(response.status).to eql(200)
    end  

    it 'Deve retornar um json de Assinaturas para un cliente action: show' do
        cliente = clientes(:fz)
        get :show, params: { cliente_id: cliente.id }
        expect(response.status).to eql(200)
    end  
    
    it 'Deve retornar um status de erro porque o ID da assinatura nao existe, action: show' do
        get :show, params: { id: 99999999 }
        expect(response.status).to eql(422)
    end   

    it 'Deve criar uma assinatura, action: create' do
        post :create, params: { "assinatura": { imei: "567898765456777", preco_anual: 240.40,
                                num_parcelas: 6, modelo_id: @modelo.id, cliente_id: @cliente.id,
                                data_emisao: Date.today, data_vencimento: Date.today+365 }}
        expect(response.status).to eql(201)
    end  

    it 'Deve excluir uma assinatura, action: destroy' do
        assinatura = assinaturas(:afz1)
        delete :destroy, params: { id: assinatura.id  }
        expect(response.status).to eql(200)

    end   
 
    it 'Deve retornar uma mensagem: ID da assinatura nao existe, action: destroy' do
        delete :destroy, params: { id: 999999999  }
        response_body = JSON.parse(response.body)
        expect(response_body.fetch('message')).to eql('ID da assinatura nao existe')

    end   
 
end

