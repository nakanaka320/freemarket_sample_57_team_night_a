Rails.application.routes.draw do
  
  devise_for :users,controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  
  # devise_for :installs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "products#index"
  get 'mypages/index', to:'mypages#index'
  get 'mypages/profile', to:'mypages#profile'
  get 'mypages/card', to: 'mypages#card'
  get 'mypages/card-new', to: 'mypages#card-new'
  get 'mypages/logout', to:'mypages#logout'
  get 'mypages/identification', to:'mypages#identification'
  delete 'cards/delete', to: 'cards#destroy'
  
  resources :products
  #get 'users', to: 'users#new' 
  #get 'login', to: 'users#login-new' #仮ルーティング、ログイン画面用のビュー
  resources :users do
    collection do
      get 'step1'
      get 'registration/step1' => 'users#step1_save'
      get 'step2'
      get 'registration-step2' => 'users#step2_save'
      get 'step3'
      post 'registration-step3' => 'users#step3_save'
      # get 'step4'
      post 'registration-step4' => 'users#step4_save'
      get 'step_complet'
      get 'sign_up_choice'
      get 'adress'
    end
  end

  resources :cards, only: [:new, :show,:create] do
    collection do
      get 'step4',to: 'cards#step4'
      post 'registration-step4'=> 'cards#create'
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#destroy'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      get 'index', to: 'purchase#index'
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end
  resources :mypages,only: [:index]
  resources :logout, only: [:index]
  resources :card,only:[:index]
 
  resource :sellitems do
    collection do
    end
  end

  get 'sell', to: 'sells#index' #仮ルーティング、商品出品ページ
  get 'detail', to: 'products#detail' #仮ルーティング、商品詳細ページ
end
