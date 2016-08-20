Rails.application.routes.draw do
  resources :marcas
  resources :abastecimentos
  resources :manutencoes
  resources :impostos
  resources :despesas
  resources :veiculos
  resources :usuarios
  resources :formaspagamentos
  resources :tiposveiculos
  resources :combustiveis
  resources :perfisusuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
