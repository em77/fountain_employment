Rails.application.routes.draw do
  
  resources :companies do
     collection do
       delete :destroy_all_listings
     end
  end

  resources :companies

  resources :admins
  resources :admin_sessions, only: [:new, :create, :destroy]

  resources :listings do
    get :autocomplete_company_name, :on => :collection
  end

  resources :listings

  get "login" => "admin_sessions#new"
  get "logout" => "admin_sessions#destroy"

  get "pages/home"
  get "pages/b_1619"
  get "pages/pass"
  get "pages/subsidy"
  get "pages/ticket_to_work"
  get "pages/trial_work_period"
  get "pages/sga"
  get "pages/benefits_calc"
  post "pages/benefits_calc"

  root to: "pages#home"

  get '*path' => redirect('/')
end
