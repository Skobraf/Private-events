Rails.application.routes.draw do
 root 'pages#home'

 resources :users, exept: [:new]

 get 'signup', to: 'users#new'
end
