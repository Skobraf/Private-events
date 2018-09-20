Rails.application.routes.draw do
 root 'pages#home'

 resources :user, exept: [:new]
 
 get 'signup', to: 'users#new'
end
