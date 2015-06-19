Rails.application.routes.draw do

  resources :pins

  devise_for :users
  root 'pins#index'

  get 'imprint' => 'pages#imprint'
  #same as: get 'pages/imprint'
  get 'contact' => 'pages#contact'
  get 'home' => 'pages#home'

end
