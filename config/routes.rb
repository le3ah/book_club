Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  # get '/books', to: 'books#index'
  delete '/reviews/:id', to: 'reviews#destroy', as: 'review'

  delete '/authors/:id', to: 'authors#destroy'
  get '/authors/:id', to: 'authors#show', as: 'author'

  post '/users', to: 'users#create', as: 'users'
  get  '/users/:id', to: 'users#show', as: 'user'
  get '/users/new', to: 'users#new', as: 'new_user'

  get '/books/:book_id/reviews/new', to: 'reviews#new', as: 'new_book_review'
  post '/books/:book_id/reviews', to: 'reviews#create', as: 'book_reviews'

  get '/books', to: 'books#index', as: 'books'
  post '/books', to: 'books#create'
  get '/books/new', to: 'books#new', as: 'new_book'
  get '/books/:id', to: 'books#show', as: 'book'
  delete '/books/:id', to: 'books#destroy'
# Mod 2 routes written as resources:
  # resources :books, :only => [:index, :show, :new, :create, :destroy] do
  #   resources :reviews, :only => [:new, :create]
  # end
  # resources :reviews, :only => [:destroy]
  # resources :authors, :only => [:show, :destroy]
  # resources :users, :only => [:new, :show, :create]
end
