HackaNewsApp::Application.routes.draw do
  root to: "links#index"

  post "/up", to: "link_votes#up"

  resources :links
  resources :users do
    resources :links, only: [:index]
  end

  resources :comments

  resource :session, only: [:new, :create, :destroy]
end
