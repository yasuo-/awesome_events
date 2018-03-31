Rails.application.routes.draw do
  root to: 'welcom#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/auth/:provider/callback',  to: 'sessions#create'
  get 'logout',                    to: 'sessions#destroy', as: :logout

  resources :users, only: [:destroy] do
    get 'retire'
  end

  resources :events, except: :index do
    resources :tickets, only: [:new, :create, :destroy]
  end

  match '*path', to: 'application#error404', via: :all
end
