Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'main#index'
get 'search'=>'main#search'
get 'login'=>'main#login'
post 'login'=>'main#login'
get 'register'=>'main#register'
post 'register'=>'main#register'
end
