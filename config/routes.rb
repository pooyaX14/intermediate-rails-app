Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
  	get 'login', to: 'devise/sessions#new'
  end

  # devise_for :users, :controllers => { :sessions => "sessions" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index' # hash mean method/action in ruby. So this line says call PagesController and its 
                         #public method index.
end
