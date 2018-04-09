Rails.application.routes.draw do
  get 'reviews/new'

  get 'reviews/create'

  get 'sessions/create'
  get 'sessions/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :movies do
    resources :reviews
  end
  
  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout' => 'sessions#destroy', as: 'signout'

  resources :sessions, only: [:create, :destroy]

  root :to => redirect('/movies')
end
