Rottenpotatoes::Application.routes.draw do
  resources :movies do
  #get 'same_director', to: 'movies#same_director', as: :same_director
  member do
    get 'same_director'
  end
  # map '/' to be a redirect to '/movies'
  root :to => redirect('movies')
  end
end
