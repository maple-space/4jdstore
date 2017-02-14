Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
 namespace :admin do
   resources :orders
 end

  namespace :account do
    resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end
  end

  resources :products do
    member do
      post :add_to_cart

    end
  end
  resources :cart_items
  resources :orders
  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end
  get '/about/', to: 'about#index'
end
