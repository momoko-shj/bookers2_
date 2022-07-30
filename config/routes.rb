Rails.application.routes.draw do
  # get 'users/show'
  # get 'users/edit'
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to:"homes#top"

get "/homes/about"=>"homes#about",as:"about"

resources:books,only:[:new,:index,:show,:edit,:update,:create,:destroy]

resources:users,only:[:show,:new,:update,:edit,:index,:create]

end

