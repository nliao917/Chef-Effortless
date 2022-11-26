Rottenpotatoes::Application.routes.draw do
  get 'recipe/index'
  get 'recipe/search', to:'recipe#search', as: 'recipe_search'
  get 'recipe/show/:id', to: 'recipe#show', as: 'recipe_show'
  get 'recipe/detail/:id', to: 'recipe#detail', as: 'recipe_detail'
  get "users/sign_up", to: "users#new", as: 'signup'
  get 'users/login', to: 'users#login', as: 'login'
  get 'users/signout', to: 'users#signout', as: 'signout'
  post 'users/sign_up', to: "users#create"

  resources :ingredients
  root to: "welcome#index"

  #match 'same_directors/:id' => 'movies#same_directors', via: :all, :as => 'same_directors'
end