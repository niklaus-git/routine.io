Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get 'team', to: 'pages#team'

  get 'test', to: 'pages#test'
    resources :routines do
      member do
        get 'activate'
      end
    end
end
