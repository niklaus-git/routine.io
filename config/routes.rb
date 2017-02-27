Rails.application.routes.draw do

  # get 'answers/new'

  # get 'answers/create'

  # get 'answers/read'

  # get 'answers/edit'

  # get 'answers/update'

  # get 'answers/destroy'


  devise_for :users

  root to: 'pages#home'

  get 'test', to: 'pages#test'
    resources :routines do
      member do
        get 'activate'
      end
    end
end
