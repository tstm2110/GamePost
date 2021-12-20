Rails.application.routes.draw do
  # devise_for :admins
  # 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  sessions: "admin/sessions"
}

  # devise_for :members
  # 顧客用
# URL /members/sign_in ...
devise_for :members, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :contacts, only:[:index]
    resources :contacts_mailer, only:[:send_mail]
    get "contacts/done" => "contacts#done"
    get "contacts/confirm" => "contacts#confirm"
    post "contacts/done" => "contacts#done"
    post "contacts/confirm" => "contacts#confirm"
    get 'search' => 'searches#search'
  # 管理者用
  namespace :admin do
    root "homes#top"
    # get '/admin/sign_out' => 'devise/sessions#destroy'
  end
 # 会員用
  scope module: :public do
    root "homes#top"
    resources :post_images, only: [:new, :create, :index, :show, :destroy]
    resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_reviews, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
  end
  end

end
