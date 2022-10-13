# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    post 'questions', to: 'questions#index'
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    resources :questions do
      resources :answers
    end
  end
  root to: 'questions#index'
  resources :questions
  resources :staffs
end
