Rails.application.routes.draw do
  namespace 'api' do
  	namespace 'v1' do
  		resources :assinaturas
		resources :modelos do
			resource :marca, only: [:show]
			resource :marca, only: [:show], path: 'relationships/marca'

		end

		resources :marcas
		resources :clientes do
			resource :assinaturas, only: [:show]

		end
  	end
  end

end
