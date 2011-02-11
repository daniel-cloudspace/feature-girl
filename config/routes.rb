FeatureGirl::Application.routes.draw do
  root :to => "features#index"

  resources :features
  resources :scenarios
end
