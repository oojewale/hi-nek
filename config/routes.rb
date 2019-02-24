Rails.application.routes.draw do
  devise_for :admin_users, { class_name: 'User' }.merge(ActiveAdmin::Devise.config)
  get '/admin', to: redirect('/admin/login')
  ActiveAdmin.routes(self)

  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    authenticated :user do
      root 'citizens#new', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :citizens
end
