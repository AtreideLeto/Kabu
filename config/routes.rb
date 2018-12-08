Rails.application.routes.draw do
  root 'top#index'
  resources :stocks do
    member {get :send_img}
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
