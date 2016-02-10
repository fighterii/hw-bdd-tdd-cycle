Rottenpotatoes::Application.routes.draw do
  root :to => redirect('movies')
  resources :movies do
    #
  #get 'same_director', to: 'movies#same_director', as: :same_director
  member do
    get 'same_director'
  end
  # map '/' to be a redirect to '/movies'
  #
  end
end
