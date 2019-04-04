Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :doses, only: [:destroy, :index]

  resources :cocktails do
    resources :doses, only: [:show, :new, :create]
    resources :ingredients, only: [:show, :new, :create]
  end
  resources :ingredients

end
