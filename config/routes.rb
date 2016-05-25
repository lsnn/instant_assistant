Rails.application.routes.draw do

  root 'tasks#new'

  get 'tasks/assign_task', to: 'tasks#assign_task'
  get 'tasks/cancel_task', to: 'tasks#cancel_task'

  resources :tasks
  resources :assistants
end