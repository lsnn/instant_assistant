Rails.application.routes.draw do

  root 'tasks#new'

  get 'tasks/assign_task', to: 'tasks#assign_task'
  get 'tasks/cancel_task', to: 'tasks#cancel_task'
  get 'tasks/choose_location', to: 'tasks#choose_location'
  get 'tasks/request_uber', to: 'tasks#request_uber'
  get 'tasks/confirm_uber', to: 'tasks#confirm_uber'
  get 'tasks/show_ride', to: 'tasks#show_ride'

  resources :tasks
  resources :assistants
end