Rails.application.routes.draw do
	get 'welcome2/index2'
	get 'welcome/index'

	#resources :articles
	resources :articles do
		#resource :comments #code default
		resources :comments #edit again
	end
	# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root 'welcome#index'
end
