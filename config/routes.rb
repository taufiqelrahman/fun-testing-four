Rails.application.routes.draw do
  scope '/api', module: 'api' do
    post :authenticate, to: 'authentication#authenticate', as: 'authenticate'
    get :me, to: 'users#me', as: 'users_me'
    resources :users, except: [:destroy]
    resources :steps, only: [:create]
  end
end
