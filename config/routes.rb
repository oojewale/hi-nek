Rails.application.routes.draw do
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

  resources :citizens, except: [:index] do
    member do
      get 'vcard' => "citizens#download_vcard", as: :download_vcard, format: :pdf
    end
    resources :candidates
  end
end
