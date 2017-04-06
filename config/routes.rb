Rails.application.routes.draw do
  config = Rails.application.config.godzilla

  constraints host: config[:staff][:host] do
    namespace :staff, path: config[:staff][:path] do
      root 'top#index'
      get 'login' => 'sessions#new', as: :login
      resource :session, only: [ :create, :destroy ]
      resource :account, except: [ :new, :create, :destroy ]
      resource :password, only: [ :show, :edit, :update ]
      resources :checkstaffs
      resources :checkmytest, only: [ :index ]
      resources :question_answers, only: [ :new, :create ]
      get 'notrecord' => 'question_answers#add'
      get 'mijuken' => 'question_answers#up'
      resource :resultmark, only: [ :show ]
    end
  end

  constraints host: config[:admin][:host] do
    namespace :admin, path: config[:admin][:path] do
      root 'top#index'
      get 'login' => 'sessions#new', as: :login
      # 9/16 arai
      post 'question_infos/new' => 'question_infos#new'
      resources :question_choice_infos
      resources :question_infos, except: [ :new ]
      #
      resource :session, only: [ :create, :destroy ]
      resource :password, only: [ :show, :edit, :update ]
      resources :accounts
      resources :year_managements

      resources :test_basic_infos
      delete 'delete_test_basic_infos' => 'test_basic_infos#destroy'
      resources :test_infos

    end
  end

  root 'errors#not_found'
  get '*anything' => 'errors#not_found'
end
