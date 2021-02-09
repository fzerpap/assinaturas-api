require "rails_helper"

RSpec.describe AssinaturasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/assinaturas").to route_to("assinaturas#index")
    end

    it "routes to #show" do
      expect(get: "/assinaturas/1").to route_to("assinaturas#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/assinaturas").to route_to("assinaturas#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/assinaturas/1").to route_to("assinaturas#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/assinaturas/1").to route_to("assinaturas#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/assinaturas/1").to route_to("assinaturas#destroy", id: "1")
    end
  end
end
