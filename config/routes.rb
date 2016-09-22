Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'kik#index'
post '/' => 'kik#webhook'
post '/callbacks/kik/messages' => "kik#webhook"

resources :kik
end
