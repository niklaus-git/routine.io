Rails.application.routes.draw do

  get 'fields/index'

  get 'fields/new'

  get 'fields/create'

  get 'fields/edit'

  get 'fields/update'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get 'team', to: 'pages#team'

  get 'test', to: 'pages#test'

  resources :routines do
    member do
      get 'submit'
    end
    resources :questions
  end

  resources :answers do
    resources :fields
  end
end
