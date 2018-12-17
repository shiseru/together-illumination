Rails.application.routes.draw do
  devise_for :users
  get '/' => 'home#top'
  get 'home/show' => 'home#show'
  get 'about' => 'home#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
