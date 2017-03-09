Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get 'team', to: 'pages#team'

  post 'sort', to: 'questions#sort'

  resources :routines do
    member do
      get 'submit'
      post 'template'
      post 'use_template'
    end
    resources :questions, except: [:index]
    get 'editor', to: 'questions#index'
  end

  resources :answers do
    put 'goto', to: 'answers#goto', as: :goto_show
    resources :fields
    put 'save', to: 'fields#save', as: :save
    put 'goto', to: 'fields#goto', as: :goto
  end


end
