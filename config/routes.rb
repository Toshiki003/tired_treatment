Rails.application.routes.draw do
  root to: "home#top"
  resources :treats, only: %i[index new create show]
end
