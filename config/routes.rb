Rails.application.routes.draw do

  root 'tasks#new'

  get 'tasks/assign_task', to: 'tasks#assign_task'

  resources :tasks
  resources :assistants
end