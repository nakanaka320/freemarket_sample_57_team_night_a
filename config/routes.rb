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
  
  
  resources :products do
    collection do
      get 'detail', to: 'products#detail'
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
      # delete 'card2s/delete', to: 'card2s#destroy'
    end
  end

  resources :purchase, only: [:index] do
    collection do
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

end
