Rails.application.routes.draw do
  namespace 'api' do
  	namespace 'v1' do
  		resources :assinaturas
  	end
  end
  namespace 'api' do
  	namespace 'v1' do
  		resources :modelos
  	end
  end
  namespace 'api' do
  	namespace 'v1' do
  		resources :marcas
  	end
  end
  namespace 'api' do
  	namespace 'v1' do
  		resources :clientes
  	end
  end

end
