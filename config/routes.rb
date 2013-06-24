EGap::Application.routes.draw do
  namespace :api do
    resources :pages, defaults: { format: 'json' } do
      collection do
        get :published
        get :unpublished
      end
      
      member do
        post :publish
        post :unpublish
      end
    end
  end
end
