Rails.application.routes.draw do
  get 'admin/index'

  get 'admin/vproduct'

  get 'admin/vuser'

  get 'product/show'

  get 'product/edit'
  post 'product/edit'
  
  get 'product/delete'

  get 'product/createauction'

  get 'product/cancelauction'

  get 'product/editauction'
  get 'verify/:id'=>'main#verify'
  get 'auction/create'
get 'product/'=>'product#index'

  get 'auth/callback' =>"auth0#callback"

  get 'auth/failure'=>'auth0#failure'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'main#index'
get 'search'=>'main#search'
get 'profile/(:id)'=>'main#profile'

get 'login'=>'main#login'
post 'login'=>'main#login'
get 'register'=>'main#registercomplete'
post 'register'=>'main#registercomplete'
get  'logout'=>'main#logout'
get 'regsucess'=>'main#regsucess'
get 'loginsucess'=>'main#loginsucess'
get 'loginfail'=>'main#loginfail'
get  'auction/create'=>'auction#create'
post 'auction/create'=>'auction#create'

get 'admin/'=>'admin#index'
get 'admin/verifyuser'=>'admin#vuser'

get 'admin/verifyproduct'=>'admin#vproduct'



end
