Rails.application.routes.draw do
  get 'treats/index'
  get 'treats/new'
  get 'treats/show'
  get "/", to: "home#top"
end
