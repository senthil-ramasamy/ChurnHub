Rails.application.routes.draw do
  resources :testmodels
  resources :trainmodels
  resources :complaints
  get 'welcome/index'
  get 'feed' => 'probs#feed'

  resources :challenges
  post '/rate' => 'rater#create', :as => 'rate'
  mount Commontator::Engine => '/commontator'
  resources :solns
  resources :vprobs
  resources :probs
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :probs do
  		resources :vprobs	
  		resources :solns
	end
  resources :probs do
  member do
      put "like", to: "probs#upvote"
      put "dislike", to: "probs#downvote"
    end
  end
  resources :solns do
  member do
      put "like", to: "solns#upvote"
      put "dislike", to: "solns#downvote"
    end
  end
  resources :solns do
  resources :versions, only: [:destroy] do
      member do
      get :diff, to: 'versions#diff'
      patch :rollback, to: 'versions#rollback'
      end
  end
  end
  get '/publish' => 'trainmodels#trainbutton'
  get '/testdata' => 'testmodels#testbutton'

end
