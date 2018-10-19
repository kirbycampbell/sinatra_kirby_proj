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

  get '/users/:slug' do
  @user.find_by_slug(params[:slug])
  erb :'/users/show'
end

get '/logout' do
  if logged_in?
    session.clear
    redirect "/login"
  else
    redirect "/"
  end
end

  post '/signup' do
  if params[:name] != "" && params[:dob] != "" && params[:password] != ""
    @user = User.create(:name => params[:name], :dob => params[:dob], :password => params[:password])
    if @user.save
      session[:user_id] = @user.id
      redirect "/tables"
    else
       redirect "/signup"
     end
  else
    redirect "/signup"
  end
end

post '/login' do
  user = User.find_by(:name => params[:name])
  if user != nil && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/tables"
  else
    redirect "/login"
  end
end

end
