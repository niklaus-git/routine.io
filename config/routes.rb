Rails.application.routes.draw do

  get 'routine/new'

  get 'routine/create'

  get 'routine/read'

  get 'routine/edit'

  get 'routine/update'

  get 'routine/destroy'

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
