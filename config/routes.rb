Rails.application.routes.draw do
  root to: 'static#home'

  get '/:page' => 'static#show'
end
