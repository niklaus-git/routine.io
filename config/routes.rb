Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root to: 'pages#home'

  get 'team', to: 'pages#team'

  put 'sort', to: 'questions#sort'

  resources :routines do
    member do
      get 'submit'
    end
    resources :questions, except: [:index]
    get 'editor', to: 'questions#index'
  end

  resources :answers do
    resources :fields
    put 'save', to: 'fields#save', as: :save
  end


end
