# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, skip: :sessions
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api do
    namespace :v1 do
      resources :shows, param: :identifier, only: %i[index show]
      resources :episodes, param: :identifier, only: :show
    end
  end
end
