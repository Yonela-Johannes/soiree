Rails.application.routes.draw do
  get 'sass/home'
  devise_for :users
  root to: "pages#home"
  # events # index show on dash
  # tasks # dont need a whole new page - do from event

  resources :events, only: %i[new create show update] do
    resources :messages, only: %i[create index ]

    # define route to collaboration
    resources :collaborations, only: %i[create]
    resources :tasks, only: %i[create index update destroy]
    resources :expenses, only: %i[create index update destroy]
    resources :guests, only: %i[create index update destroy]
  end
end
