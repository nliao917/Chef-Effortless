Rottenpotatoes::Application.routes.draw do
  resources :ingredients
  # map '/' to be a redirect to '/movies'
  root :to => redirect('/ingredients')
end
