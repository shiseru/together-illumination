Rails.application.routes.draw do
  devise_for :users
  resources :rooms#, only: [:show, :destroy]
  post 'rooms/:id/create_message' => 'rooms#create_message'
  post 'rooms/:owner_id/:participant_id/:post_id/create' => 'rooms#create'

  resources :posts
  get '/' => 'home#top'
  get 'home/show' => 'home#show'
  get 'about' => 'home#about'
  get 'mypage' => 'home#mypage'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'posts#index'
end