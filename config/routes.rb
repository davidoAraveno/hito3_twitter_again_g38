Rails.application.routes.draw do

  # //////api////////
  get 'tweets/news', to: 'tweets#news'
  
  # ///////sesiones///////
  get 's/new', to: 'sessions#new'
  get 's/ima', to: "sessions#images", as: 'images'
  post 's/create', to: 'sessions#create', as: 'sc'
  delete 's/delete', to: 'sessions#destroy', as: "c_session"
  
  # //////////////modelo user////////////
  get 'n/user', to: "users#new"
  get 'i/user', to: "users#index"
  post 'c/user', to: "users#create", as: "cu"

  # /////////////modelo friend/////////////////////
  post 'c/friend', to: 'friends#create', as: 'c_friend'
  post 'd/friend', to: 'friends#destroy', as: 'd_friend'

  # //////////modelo tweet///////////////////
  get 'i/tweets', to: 'tweets#index'

  
  post 'c/tweets', to: 'tweets#create', as: 'ct'
  
  get 'get/tweets', to: 'tweets#create', as: 'ctget'
  
  get 'tweets/:busqueda', to: 'tweets#index', as: 'busqueda'
  get 'tweets/:tag', to: 'tweets#index', as: 'busqueda_tag'

  get 'tweets/index/:retweet', to: 'tweets#index', as: 'retweet'
  
  get 's/tweets/:id', to: 'tweets#show', as: 'st'

  # ////////////modelo like//////////////////
  get 'c/likes/:id_tweet/:id_user', to: 'likes#create', as: "nuevo_like"

  root 'sessions#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
