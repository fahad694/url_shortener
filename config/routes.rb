Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'shortened_urls#new'
  get '/:id' => "shortener/redirection_urls#show"
  resources :shortened_urls, only: [:new, :create, :show]
  # Defines the root path route ("/")
  # root "articles#index"
end
