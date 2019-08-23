Rails.application.routes.draw do
  root 'cep#index'
  get 'cep', to: 'cep#index'
  post 'cep', to: 'cep#cep'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'cepjs', to: 'cepjs#index'
  get 'zipcode', to: 'cepjs#show'
  

end
