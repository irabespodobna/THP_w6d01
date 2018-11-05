Rails.application.routes.draw do
  get 'static_page/show'
	get 'log/new'
	get 'sessions/new'
	root to: 'static_page#show'
	get '/secretpage', to: 'secret_page#show'
	get    '/login',   to: 'sessions#new'
	post   '/login',   to: 'sessions#create'
	delete '/logout',  to: 'sessions#destroy'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
