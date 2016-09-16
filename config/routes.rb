Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'kik_api#index'
post '/' => 'kik_api#webhook'
post '/callbacks/kik/messages' => "kik_api#webhook"

end
