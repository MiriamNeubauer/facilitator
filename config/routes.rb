Rails.application.routes.draw do

  root 'pages#home'

  get 'imprint' => 'pages#imprint'
  #same as: get 'pages/imprint'
  get 'contact' => 'pages#contact'
  get 'home' => 'pages#home'

end
