Rails.application.routes.draw do
  namespace 'api' do
  	namespace 'v1' do
  		resources :assinaturas
		resources :modelos
		resources :marcas
		resources :clientes
  	end
  end

end
