Rails.application.routes.draw do
  namespace :api do
    resources :words do
    end
    resources :definitions do

    end
  end
end
