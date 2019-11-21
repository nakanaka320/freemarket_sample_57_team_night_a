Rails.application.routes.draw do
  
  # devise_for :users
  root to: "products#index"
  get 'mypage', to: 'mypages#index'
  get 'profile', to: 'mypages#edit'
  get 'users', to: 'users#new' 
  get 'login', to: 'users#login-new' #仮ルーティング、ログイン画面用のビュー
  get 'logout', to: 'users#logout' #仮ルーティング、ログアウト画面用のビュー
  
  resource :products
  resource :users

end
