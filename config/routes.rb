Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
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
      get 'step4'
      post 'registration-step4' => 'users#step4_save'
      get 'step_complet'
      get 'login_new'
      get 'sign_up_choice'
      get 'adress'
    end
  end
end
