Rails.application.routes.draw do
  namespace 'api' do
  	namespace 'v1' do
  		resources :empresas
  	end
  end
  namespace 'api' do
  	namespace 'v1' do
  		resources :countries
  	end
  end
  namespace 'api' do
  	namespace 'v1' do
  		resources :languages
  	end
  end
  namespace 'api' do
  	namespace 'v1' do
  		resources :currencies
  	end
  end
end
