Rails.application.routes.draw do
  get 'account/index'
 
  get 'account/login_prompt'
  
  
  get "homepage/index" => "homepage#index"
  root to: "homepage#index"

  devise_for :users

  get 'stations/index'
  get 'help/index'
  get 'about/index'
  get 'pricing_and_payment/index'
  get 'pricing_and_payment/add_funds' => 'pricing_and_payment#add_funds'

  get 'rides/index'
  resources :rides


  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  Rails.application.routes.draw do 
    get '/users/sign_in' => 'devise/sessions#new'
  end
end