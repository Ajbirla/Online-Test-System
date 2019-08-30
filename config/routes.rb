Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  authenticated :user, ->(u) { u.role == "user" } do #user
    get '/finalsubmit/:id'  => "answers#submit_test",as: 'submit_test'
    get '/test/:id' => "tests#paper", as: 'paper'
    get '/answer/test/:id' => "answers#result", as: 'result'
    resources :answers
    resources :tests, only:[:index,:show,:paper]
    resources :users, except:[:index,:new,:create] 
  end

  authenticated :user, ->(u) { u.role == "admin" } do #admin
    # root 'admin/home#index'
    namespace :admin do
      root 'home#index'
      resources :users, only:[:index, :show]
      resources :questions
      resources :tests do
        member do
          get 'preview'
        end
      end
    end
  end
  get "/*a" => "home#not_found"
   # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# get 'tests/paper'
# get 'tests/get_time'
end