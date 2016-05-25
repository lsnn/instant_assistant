Rails.application.routes.draw do

  root 'tasks#new'

  get 'tasks/assign_task', to: 'tasks#assign_task'
  get 'tasks/cancel_task', to: 'tasks#cancel_task'
  get 'tasks/choose_location', to: 'tasks#choose_location'

  resources :tasks
  resources :assistants
end