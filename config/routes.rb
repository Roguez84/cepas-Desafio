Rails.application.routes.draw do
  post "wines", to: "wines#create"
  root 'wines#index'
end
