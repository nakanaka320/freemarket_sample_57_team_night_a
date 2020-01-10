Rails.application.routes.draw do
  
  devise_for :users,controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  
  # devise_for :installs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "products#index"
  get 'mypages/index', to:'mypages#index'
  get 'mypages/profile', to:'mypages#profile'
  get 'mypages/card', to: 'mypages#card'
  get 'mypages/logout', to:'mypages#logout'
  get 'mypages/identification', to:'mypages#identification'
  get 'mypages/card', to:'mypages#card'
  delete 'card2s/delete', to: 'card2s#destroy'
  
  resource :products
  #get 'users', to: 'users#new' 
  #get 'login', to: 'users#login-new' #仮ルーティング、ログイン画面用のビュー
  resource :users do
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
      get 'login_new'
      get 'sign_up_choice'
      get 'adress'
    end
  end

  resource :card2s, only: [:new, :show] do
    collection do
      get 'step4',to: 'card2s#step4'
      post 'registration-step4'=> 'card2s#create'
      post 'show', to: 'card2s#show'
      post 'pay', to: 'card2s#pay'
      post 'delete', to: 'card2s#destroy'
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
