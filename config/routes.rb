Rails.application.routes.draw do

  root "sign_in#index"
  post "sign-in", to: "sign_in#create"

  get "need-auth", to: "sign_in#need_auth"
end
