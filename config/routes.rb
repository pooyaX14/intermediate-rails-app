Rails.application.routes.draw do

  # devise_for :users
  # to customize controllers. devise_for telling it to use 
  # registrations controller to use for model User

  devise_for :users, :controllers => { :registrations => "registrations"} 

  # if you wish to display login page on custome URL which is /login. 
  #But devise creates a /users/sign_in URL for us. You can make custom URL using devise_scope method just like
  # we did below. Now if you go /login page, it will render login page without error.
  
  devise_scope :user do
  	get 'login', to: 'devise/sessions#new'
  end

  # devise_for :users, :controllers => { :sessions => "sessions" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#index' # hash mean method/action in ruby. So this line says call PagesController and its 
                         #public method index.
end
