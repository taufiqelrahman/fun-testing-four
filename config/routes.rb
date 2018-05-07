Rails.application.routes.draw do
<<<<<<< HEAD
  root 'application#app'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======
  scope '/api', module: 'api' do
    post :authenticate, to: 'authentication#authenticate', as: 'authenticate'
    get :me, to: 'users#me', as: 'users_me'
    resources :features, except: [:create] do
      get :scenarios, on: :member, to: 'features#scenarios'
    end
    resources :squads, except: [:destroy] do
      get :features, on: :member, to: 'squads#features'
      post :features, on: :member, to: 'squads#create_feature'
    end
    resources :users, except: [:destroy]
    resources :steps, only: [:create]
    resources :scenarios
  end
>>>>>>> f57540e0a1f812b6a297591f3e7466d2e4e17654
end
