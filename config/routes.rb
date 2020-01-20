Rails.application.routes.draw do
  
  devise_for :users,controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  
  # devise_for :installs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "products#index"

  resources :mypages, only: [:index] do
    collection do
      get 'profile', to:'mypages#profile'
      get 'card', to: 'mypages#card'
      get 'card-new', to: 'mypages#card-new'
      get 'logout', to:'mypages#logout'
      get 'identification', to:'mypages#identification'
    end
  end
  
  resources :products do
    collection do
      get 'detail', to: 'products#detail' #商品詳細ページ
      get 'edit', to: 'products#edit'
    end
  end

  resources :users do
    collection do
      get 'step1'
      get 'registration/step1', to: 'users#step1_save'
      get 'step2'
      get 'registration-step2', to: 'users#step2_save'
      get 'step3'
      post 'registration-step3', to: 'users#step3_save'
      # get 'step4'
      post 'registration-step4', to: 'users#step4_save'
      get 'step_complet'
      get 'sign_up_choice'
      get 'adress'
    end
  end

  resources :card2s, only: [:new, :show,:create] do
    collection do
      get 'step4',to: 'card2s#step4'
      post 'registration-step4', to: 'card2s#create'
      post 'pay', to: 'card2s#pay'
      post 'delete', to: 'card2s#destroy'
    end
  end

  resources :purchase, only: [:index] do
    collection do
      post 'pay', to: 'purchase#pay'
      get 'done', to: 'purchase#done'
    end
  end

  resource :sells do
    collection do
      get 'category_children' 
      get 'category_grandchildren'
    end
  end
  post 'sellitem-registration'=> 'sells#create'
  get 'sell', to: 'sells#new' #仮ルーティング、商品出品ページ
  get 'profile', to: 'mypages#edit' #仮ルーティング、プロフィール編集画面
  get 'identification', to: 'mypages#identification' #仮ルーティング、ユーザー本人確認画面
  get 'logout', to: 'users#logout' #仮ルーティング、ログアウト画面用のビュー
  get 'buy', to: 'users#buy' #仮ルーティング、商品購入確認ページ
  get 'card', to: 'users#card' #仮ルーティング(step4になるページ)クレジットカード登録ページ
  get 'detail', to: 'products#detail' #仮ルーティング、商品詳細ページ
  get 'card', to: 'users#card' #仮ルーティング、クレジットカード登録ページ
  resources :mypages,only: [:index]
  resources :logout, only: [:index]
  resources :card,only:[:index]
 
  resource :sellitems do
    collection do
    end
  end

end
