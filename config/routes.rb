Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  resources :post_review, only: [:create, :destroy]
  end
end
