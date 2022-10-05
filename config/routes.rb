# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    resources :questions do
      resources :answers
    end
  end
  root to: 'questions#index'
  resources :questions
end
