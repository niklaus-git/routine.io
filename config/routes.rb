Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get 'team', to: 'pages#team'

  get 'test', to: 'pages#test'

  resources :routines do
    member do
      get 'activate'
    end
    resources :questions
  end
end
