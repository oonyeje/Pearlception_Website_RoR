Rails.application.routes.draw do

  root "dashboard#index"
  resources :runs

  devise_for :users, :controllers => {:registrations => 'registrations'}
  devise_scope :users do
    get 'signin' => 'registrations#new'
    post 'signin' => 'registrations#create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
