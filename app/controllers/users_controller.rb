require './config/environment'

class UsersController < ApplicationController

  get '/signup' do
    erb :'/users/signup'
  end

  get '/login' do
    if !logged_in?
      erb :'/users/login'
    else
      redirect "/tables"
    end
  end

end
