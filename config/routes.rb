Rails.application.routes.draw do
  devise_for :users
  scope '(:locale)', locale: /fr|nl|en/ do
    root to: 'pages#home'
    resources :tags
    resources :contents
  end
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
