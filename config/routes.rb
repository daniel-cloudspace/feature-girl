FeatureGirl::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  resources :features
  resources :scenarios

  match 'network' => 'scenarios#network', :as => 'network'
end
