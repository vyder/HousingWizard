HousingWizard::Application.routes.draw do

  resources :queries
  resources :renter_criteria
  resources :renter_departments
  resources :renters
  resources :criteria

  get "wizard/setup"
  get "wizard/calculate"
  get "wizard/show"

  root :to => 'wizard#setup'

end
