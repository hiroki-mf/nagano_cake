Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :snow, :new, :create, :edit, :update]
    resources :customers, only: [:index, :snow, :edit, :update]
    resources :orders, only: [:snow, :update]
  end

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  scope module: :public do
    root to: "homes#top"
    resources :items, only: [:index, :snow]
    get 'customers/unsubscribe', to: 'customers#unsubscribe', as: 'unsubscribe_customer'
    patch 'customers/withdrawal', to: 'customers#withdrawal', as: 'withdrawal_customer'
    resources :customers, only: [:snow, :edit, :update]
    delete 'cart_itmes/all_destroy', to: 'cart_itmes#all_destroy', as: 'all_destroy_cart_itmes'
    resources :cart_itmes, only: [:index, :update, :create, :destroy]
    post 'orders/confirm', to: 'orders#confirm', as: 'confirm_order'
    get 'orders/complete', to: 'orders#complete', as: 'complete_order'
    resources :orders, only: [:new, :create, :index, :show]
    resources :addresses, only: [:edit, :create, :index, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
