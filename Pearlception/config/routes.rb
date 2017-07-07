require 'subdomain'

Rails.application.routes.draw do
  #get 'suppliers_distributors/index'

  #get 'suppliers_distributors/new'

  #post 'suppliers_distributors/create'

    get '/pearlception', to: "dashboard#index" 
    # More subdomain constrained routes...
    get 'oysters/show'
    get 'oysters/index'

    #get "dashboard/pearlception" => 'dashboard#index'
    resources :runs
    resources :companies
    resources :grades
    resources :suppliers_distributors
	resources :statistics
    devise_for :users, :controllers => {:registrations => 'registrations', :sessions => 'sessions'}
    #devise_for :users, controllers: {:sessions => 'session'}
    devise_scope :users do
      get 'signin' => 'registrations#new'
      post 'signin' => 'registrations#create'
      get 'signin'  => 'sessions#new'
      post 'signin' => 'sessions#create'
    end

  #binding.pry

  get 'pages/home' => 'high_voltage/pages#show', id: 'home'
  get 'pages/applications/3D' => 'high_voltage/pages#show'
  get 'pages/applications/application' => 'high_voltage/pages#show'
  get 'pages/applications/applications' => 'high_voltage/pages#show'
  get 'pages/applications/FS' => 'high_voltage/pages#show'
  get 'pages/applications/fsimages' => 'high_voltage/pages#show'
  get 'pages/applications/ME' => 'high_voltage/pages#show'
  get 'pages/applications/SI' => 'high_voltage/pages#show'
  get 'pages/awards/asae_PaperAward' => 'high_voltage/pages#show'
  get 'pages/awards/awards' => 'high_voltage/pages#show'
  get 'pages/awards/Copy of awards' => 'high_voltage/pages#show'
  get 'pages/awards/outstandresearch' => 'high_voltage/pages#show'
  get 'pages/awards/tae50C' => 'high_voltage/pages#show'
  get 'pages/awards/TAE50P' => 'high_voltage/pages#show'
  get 'pages/awards/TCollg' => 'high_voltage/pages#show'
  get 'pages/awards/TEye' => 'high_voltage/pages#show'
  get 'pages/awards/TgodRch' => 'high_voltage/pages#show'
  get 'pages/awards/Top50' => 'high_voltage/pages#show'
  get 'pages/awards/TPaper1' => 'high_voltage/pages#show'
  get 'pages/awards/tpaper2' => 'high_voltage/pages#show'
  get 'pages/awards/tpaper3' => 'high_voltage/pages#show'
  get 'pages/awards/TPaperAw' => 'high_voltage/pages#show'
  get 'pages/awards/tpaperbw' => 'high_voltage/pages#show'
  get 'pages/awards/TPatent' => 'high_voltage/pages#show'
  get 'pages/awards/TPE' => 'high_voltage/pages#show'
  get 'pages/awards/yangDesigner' => 'high_voltage/pages#show'
  get 'pages/CDE/CD' => 'high_voltage/pages#show'
  get 'pages/CDE/CDE' => 'high_voltage/pages#show'
  get 'pages/CDE/CSD' => 'high_voltage/pages#show'
  get 'pages/CDE/Testing' => 'high_voltage/pages#show'
  get 'pages/CDE/VSD' => 'high_voltage/pages#show'
  get 'pages/contactus/contactus' => 'high_voltage/pages#show'
  get 'pages/formbuilder/web/forms/thanks' => 'high_voltage/pages#show'
  get 'pages/include/head' => 'high_voltage/pages#show'
  get 'pages/IVA/MS' => 'high_voltage/pages#show'
  get 'pages/IVA/IVA' => 'high_voltage/pages#show'
  get 'pages/IVA/ORG' => 'high_voltage/pages#show' 
  get 'pages/news/news' => 'high_voltage/pages#show' 
  get 'pages/partner/partner' => 'high_voltage/pages#show'
  get 'pages/product/P1' => 'high_voltage/pages#show'
  get 'pages/product/P2' => 'high_voltage/pages#show'
  get 'pages/product/P3' => 'high_voltage/pages#show'
  get 'pages/services/CI' => 'high_voltage/pages#show'
  get 'pages/services/CS' => 'high_voltage/pages#show'
  get 'pages/services/services' => 'high_voltage/pages#show'
  get 'pages/services/TS' => 'high_voltage/pages#show'

  HighVoltage.configure do |config|
    config.home_page = 'home'
    config.route_drawer = HighVoltage::RouteDrawers::Root
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
