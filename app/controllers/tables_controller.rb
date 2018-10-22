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

get '/tables/:id/edit' do
  if logged_in?
    @table = Table.find_by_id(params[:id])
    if @table && current_user.table == @table
      erb :'tables/edit_table'
    else
      redirect to '/tables'
    end
  else
    redirect to '/login'
  end
end

patch '/tables/:id' do
  if logged_in?
    if params[:content] == ""
      redirect to "/tables/#{params[:id]}/edit"
    else
      @table = Table.find_by_id(params[:id])
      if @table && current_user.table == @table
        if @table.update(content: params[:content])
          redirect to "/tables/#{@table.id}"
        else
          redirect to "/tables/#{@table.id}/edit"
        end
      else
        redirect to '/tables'
      end
    end
  else
    redirect to '/login'
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
