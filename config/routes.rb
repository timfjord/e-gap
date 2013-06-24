EGap::Application.routes.draw do
  namespace :api do
    resources :pages, defaults: { format: 'json' }
  end
end
