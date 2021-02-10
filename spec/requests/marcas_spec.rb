require 'rails_helper'

RSpec.describe "/marcas", type: :request do
  
  before(:each) do
   
    valid_attributes = {"nome": "Sony"}
    #let(:valid_attributes) {{"nome": "Sony"}}

    invalid_attributes = {"nome": nil}
    #let(:invalid_attributes) {{"nome": nil}}

    valid_headers = {"Content-Type": "application/json" }
  end
  

  describe "GET /index" do
    it "renders a successful response" do
      #Marca.create! valid_attributes
      #get marcas_url, headers: valid_headers, as: :json
      get marcas_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      marca = Marca.create! valid_attributes
      get marca_url(marca), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Marca" do
        expect {
          post marcas_url,
               params: { marca: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Marca, :count).by(1)
      end

      it "renders a JSON response with the new marca" do
        post marcas_url,
             params: { marca: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Marca" do
        expect {
          post marcas_url,
               params: { marca: invalid_attributes }, as: :json
        }.to change(Marca, :count).by(0)
      end

      it "renders a JSON response with errors for the new marca" do
        post marcas_url,
             params: { marca: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested marca" do
        marca = Marca.create! valid_attributes
        patch marca_url(marca),
              params: { marca: new_attributes }, headers: valid_headers, as: :json
        marca.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the marca" do
        marca = Marca.create! valid_attributes
        patch marca_url(marca),
              params: { marca: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the marca" do
        marca = Marca.create! valid_attributes
        patch marca_url(marca),
              params: { marca: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested marca" do
      marca = Marca.create! valid_attributes
      expect {
        delete marca_url(marca), headers: valid_headers, as: :json
      }.to change(Marca, :count).by(-1)
    end
  end
end
