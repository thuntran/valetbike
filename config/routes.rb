Rails.application.routes.draw do
  devise_for :users
  root to: "stations#index"

  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  Rails.application.routes.draw do 
    get '/users/sign_in' => 'devise/sessions#new'
  end
end