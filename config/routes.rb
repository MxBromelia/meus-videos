Rails.application.routes.draw do
  resources :categories do
    patch :bookmark, on: :member

    resources :videos, shallow: true, except: %i[index edit update]
    get 'videos', on: :member, to: 'categories#show'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
