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
    # Use Below code for connecting table to a user
    #@table = Table.find(current_user.table.id)
    @table = Table.find_by_id(params[:id])
    erb :'/tables/show_table'
  else
    redirect '/login'
  end
end


  post '/newtable' do
    @table = Table.find_or_create_by(:table_number => params[:table_number])
    @user = current_user

    if @table.save
      @user.table = @table
      @user.save
      @table.save
      redirect "/tables"
    else
       redirect "/tables"
     end
  end

  delete '/tables/:id/delete' do
  if logged_in?
    @table = Table.find_by_id(params[:id])
    if @table
      @table.delete
    end
    redirect to '/tables'
  else
    redirect to '/login'
  end
end

end
