Rails.application.routes.draw do
  get 'categories/show'

  get 'categories/index'

  get 'categories/create'

  get 'categories/destroy'=>'categories#delete'

  get 'categories/new'


get '/verifywarning'=>'main#userverify'
get 'admin/index'
post 'auction/edit'=>'auction#edit'
get 'admin/vproduct'

get 'admin/vuser'

get 'product/show'

get '/admin/makeadmin'=>'admin#makeadmin'

get 'product/edit'
post 'product/edit'

get '/auction/history'=>'auction#history'
get 'product/delete'

get 'product/createauction'

get 'product/cancelauction'

get 'product/editauction'
get 'verify/:id'=>'main#verify'

get 'product/'=>'product#index' 


# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root 'main#index'
get 'profile/(:id)'=>'main#profile'
get 'banned'=>'main#ban'
get '/admin/ban'=>'admin#banuser'
get 'login'=>'main#login'
post 'login'=>'main#login'
get 'register'=>'main#registercomplete'
post 'register'=>'main#registercomplete'
get  'logout'=>'main#logout'
get 'regsucess'=>'main#regsucess'
get 'loginsucess'=>'main#loginsucess'
get 'loginfail'=>'main#loginfail'
get  'product/create'=>'product#create'
post 'product/create'=>'product#create'

get 'admin/'=>'admin#index'
get 'admin/verifyuser'=>'admin#vuser'
get 'admin/verifyproduct'=>'admin#vproduct'


post 'product/schedule'=>'product#schedule'
get 'product/cancel'=>'product#cancel'

get 'auction/edit'=>'auction#edit'
get 'auction/verify'=>'admin#verifyauction'


get 'auction/cancel'=>'auction#cancel'

get 'auction/show'=>'auction#show'

get 'auction/bid'=>'auction#bid'


get 'ajax/addbid'=>'auction#placebid'
get 'ajax/bidlist'=>'auction#bidlist'


get 'search'=>'main#search_pro'
get 'admin/vwusers'=>'admin#vwuser'

get 'admin/vwproducts'=>'admin#vwproduct'

get 'ajax/cancelbid/:id'=>'auction#cancelbid'

	post 'categories/new'=>'categories#create'
	resources :categories


end