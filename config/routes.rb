Rottenpotatoes::Application.routes.draw do
  get 'recipe/index'

  resources :ingredients
  root to: "welcome#index"
end