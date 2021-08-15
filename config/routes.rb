Rails.application.routes.draw do
  root 'home#index'
  resources :categories do
    patch :bookmark, on: :member

    resources :videos, shallow: true, except: %i[index edit update] do
      resources :comments, shallow: true, only: %i[create update destroy]
    end
    get 'videos', on: :member, to: 'categories#show'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
