require './config/environment'

class TablesController < ApplicationController

  get '/tables' do
    @tables = Table.all

    erb :'/tables/table'
  end

  get '/tables/:id' do
  if logged_in?
    @user = current_user
    #binding.pry
    @table = Table.find(current_user.table.id)
    erb :'/tables/show_table'
  else
    redirect '/login'
  end
end


  post '/newtable' do
    @table = Table.create(:table_number => params[:table_number])
    @user = current_user

    if @table.save
      @user.table = @table
      @user.save
      @table.save
      redirect "/tables/show_table"

    else
       redirect "/tables"
     end
  end

end
