# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
						 skip: %i[sessions registrations],
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
               registration: 'signup'
             },
             controllers: {
               sessions: 'sessions',
               registrations: 'registrations'
             }

	as :user do
		post 'login', to: 'sessions#create', as: :user_session
		delete 'logout', to: 'sessions#destroy', as: :destroy_user_session
		post 'signup', to: 'registrations#create', as: :user_registration
	end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :events, only: %w[index create update show destroy]
  resources :projects
end
