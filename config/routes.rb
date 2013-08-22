DimisionRajoy::Application.routes.draw do
  resources :votes
  resources :verifications
  resources :comments
  root 'welcome#index'
end
