require './config/environment'

class TablesController < ApplicationController

  get '/tables' do
    if logged_in?
      @tables = Table.all

      erb :'/tables/table'
    else
      redirect to '/login'
    end
  end

  get '/tables/new' do
  if logged_in?
    erb :'/tables/create_table'
  else
    redirect '/login'
  end
end

  get '/tables/:id' do
  if logged_in?

    @table = Table.find_by_id(params[:id])
    erb :'/tables/show_table'
  else
    redirect '/login'
  end
end

get '/tables/:id/edit' do
  if logged_in?
    @table = Table.find_by_id(params[:id])
    if @table && @table.user_id == current_user.id
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
      if @table && @table.user_id == current_user.id
        if @table.update(:table_number => params[:table_number], :head_count => params[:head_count], :waiter_name => params[:waiter_name])
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
    if logged_in?
      @table = Table.find_or_create_by(:table_number => params[:table_number], :head_count => params[:head_count], :waiter_name => params[:waiter_name])
      if @table.save
        @table.user_id = current_user.id
        @table.save
        redirect "/tables/#{@table.id}"
      else
         redirect "/tables"
       end
     else
     redirect '/login'
   end
  end

  delete '/tables/:id/delete' do
  if logged_in?
    @table = Table.find_by_id(params[:id])
    if @table && @table.user_id == current_user.id
      @table.delete
    else
      redirect to '/tables'
    end
    redirect to '/tables'
  else
    redirect to '/login'
  end
end

end
