Rails.application.routes.draw do
  # simplify devise path names and change sign_in/sign_out to login/logout
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}

  resources :products do
    resources :comments
  end
  resources :users
  resources :orders, only: [:index, :show, :create, :destroy]

  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  post 'simple_pages/thank_you'
  post 'payments/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'simple_pages#landing_page'

end
