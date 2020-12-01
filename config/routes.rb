# frozen_string_literal: true

Rails.application.routes.draw do
  root 'login#index'

  resources :to_do_lists do
    post :clone, on: :member
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy', as: :destroy_user_session
  end
end
