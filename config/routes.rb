Rails.application.routes.draw do
  get 'relatorios/abastecimentos'
  post 'relatorios/abastecimentos'

  get 'relatorios/gastos'
  post 'relatorios/gastos'

  get 'relatorios/info'
  post 'relatorios/info'
  
  get 'relatorios/index'

  get 'relatorios/desempenho'
  post 'relatorios/desempenho'


  devise_for :usuarios, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
  resources :calcflex
  resources :dashboard
  resources :marcas
  resources :abastecimentos
  resources :manutencoes
  resources :impostos
  resources :despesas
  resources :veiculos
  resources :formaspagamentos
  resources :tiposveiculos
  resources :combustiveis
  resources :perfisusuarios
  root to: 'dashboard#index'
  get '/relatorios', to: 'relatorios#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
