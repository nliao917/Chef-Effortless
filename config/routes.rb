Rottenpotatoes::Application.routes.draw do
  get 'recipe/index'

  resources :ingredients
  root to: "welcome#index"

  #match 'same_directors/:id' => 'movies#same_directors', via: :all, :as => 'same_directors'
end