Rails.application.routes.draw do
  get 'product/show'

  get 'product/edit'
  post 'product/edit'
  
  get 'product/delete'

  get 'product/createauction'

  get 'product/cancelauction'

  get 'product/editauction'

  get 'auction/create'
get 'product/'=>'product#index'

  get 'auth/callback' =>"auth0#callback"

  get 'auth/failure'=>'auth0#failure'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'main#index'
get 'search'=>'main#search'
get 'login'=>'main#login'
post 'login'=>'main#login'
get 'register'=>'main#register'
get 'registercomplete'=>'main#registercomplete'
post 'registercomplete'=>'main#registercomplete'
get  'logout'=>'main#logout'
get 'regsucess'=>'main#regsucess'
get 'loginsucess'=>'main#loginsucess'
get 'loginfail'=>'main#loginfail'
get  'auction/create'=>'auction#create'
post 'auction/create'=>'auction#create'
end
