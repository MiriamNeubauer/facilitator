Rails.application.routes.draw do

resources :comments

resources :pins do
    resources :comments
  end

  resources :pins

  devise_for :users
  root 'pins#index'

  get 'imprint' => 'pages#imprint'
  #same as: get 'pages/imprint'
  get 'contact' => 'pages#contact'
  get 'home' => 'pages#home'

end
