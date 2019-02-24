Rails.application.routes.draw do
  devise_for :admin_users, { class_name: 'User' }.merge(ActiveAdmin::Devise.config)
  get '/admin', to: redirect('/admin/login')
  ActiveAdmin.routes(self)

  devise_for :users
  resources :citizens
end
