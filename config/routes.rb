Rails.application.routes.draw do
 root 'pages#home'

 resources :users, exept: [:new]

 get 'signup', to: 'users#new'

 get 'login', to: 'sessions#new'
 post 'login', to: 'sessions#create'
 delete 'logout', to: 'sessions#destroy'
end
