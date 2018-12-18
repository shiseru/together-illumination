Rails.application.routes.draw do
  devise_for :users
  resources :rooms#, only: [:show, :destroy]
  post 'rooms/:id/create_message' => 'rooms#create_message'
  resources :posts
  get '/' => 'home#top'
  get 'home/show' => 'home#show'
  get 'about' => 'home#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
