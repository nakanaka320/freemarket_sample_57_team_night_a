Rails.application.routes.draw do
  
  # devise_for :users
  root to: "products#index"
  get 'mypage', to: 'mypages#index'
  get 'profile', to: 'mypages#edit' #仮ルーティング、プロフィール編集画面
  get 'identification', to: 'mypages#identification' #仮ルーティング、ユーザー本人確認画面
  get 'users', to: 'users#new' 
  get 'login', to: 'users#login-new' #仮ルーティング、ログイン画面用のビュー
  get 'logout', to: 'users#logout' #仮ルーティング、ログアウト画面用のビュー
  get 'buy', to: 'users#buy' #仮ルーティング、商品購入確認ページ
  get 'sell', to: 'products#sell' #仮ルーティング、商品出品ページ
  get 'detail', to: 'products#detail' #仮ルーティング、商品詳細ページ
  
  
  resource :products
  resource :users

end
