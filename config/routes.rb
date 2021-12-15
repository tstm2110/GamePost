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

  root "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
