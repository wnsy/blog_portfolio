Rails.application.routes.draw do
  devise_for :users
  resources :portfolios, except: [:show]
  get 'rails-projects', to: 'portfolios#rails'
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :change_status
    end
  end
  root 'pages#home'
end
