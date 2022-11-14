Rottenpotatoes::Application.routes.draw do
  get 'recipe/index'
  get 'recipe/show/:id', to: 'recipe#show', as: 'recipe_show'
  get 'recipe/detail/:id', to: 'recipe#detail', as: 'recipe_detail'

  resources :ingredients
  root to: "welcome#index"

  #match 'same_directors/:id' => 'movies#same_directors', via: :all, :as => 'same_directors'
end