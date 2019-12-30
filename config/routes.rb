Rails.application.routes.draw do
  devise_for :users
  root to: "products#index"
  get 'mypage', to: 'mypages#index'
  get 'index', to: 'users#index'
  resource :products
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
  resource :cards do
    collection do
     get 'step4',to: 'cards#step4'
     post 'registration-step4'=> 'cards#create'
    end
  end
  get 'profile', to: 'mypages#edit' #仮ルーティング、プロフィール編集画面
  get 'identification', to: 'mypages#identification' #仮ルーティング、ユーザー本人確認画面
  get 'logout', to: 'users#logout' #仮ルーティング、ログアウト画面用のビュー
  get 'buy', to: 'users#buy' #仮ルーティング、商品購入確認ページ
  get 'card', to: 'users#card' #仮ルーティング、クレジットカード登録ページ
  get 'sell', to: 'products#sell' #仮ルーティング、商品出品ページ
  get 'detail', to: 'products#detail' #仮ルーティング、商品詳細ページ
  get 'card', to: 'users#card' #仮ルーティング、クレジットカード登録ページ
end
