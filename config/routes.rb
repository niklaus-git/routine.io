Rails.application.routes.draw do

  get 'routine/new'

  get 'routine/create'

  get 'routine/read'

  get 'routine/edit'

  get 'routine/update'

  get 'routine/destroy'

  get 'test', to: 'pages#test'

  devise_for :users
  root to: 'pages#home'
    resources :routines do
      member do
        get 'activate'
      end
    end
end
