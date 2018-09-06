# frozen_string_literal: true

Rails.application.routes.draw do
  resources :albums, only: %i[index]
  resources :images, only: %i[update]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
end
