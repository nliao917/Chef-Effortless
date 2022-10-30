Rottenpotatoes::Application.routes.draw do
  resources :ingredients
  root to: "welcome#index"
end