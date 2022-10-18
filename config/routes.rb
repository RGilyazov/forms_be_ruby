Rails.application.routes.draw do
  #resources :form_templates
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #namespace '/forms_app/api' do
  #namespace :forms_app do
   #  namespace :api do
        resources :form_templates, only: [:index,:create, :update, :destroy],path: '/forms_app/api/formTemplates'
        resources :forms, only: [:index,:create],path: '/forms_app/api/forms'
   #  end
  #end
  #end
  # Defines the root path route ("/")
  # root "articles#index"
end
