Rails.application.routes.draw do
  #resources :form_templates
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :form_templates, only: [:index,:create, :update, :destroy],path: 'formTemplates'
  resources :forms, only: [:index,:create],path: 'forms'
  # Defines the root path route ("/")
  # root "articles#index"
end
