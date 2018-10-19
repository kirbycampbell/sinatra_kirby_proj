require './config/environment'

class TablesController < ApplicationController

  get '/tables' do
    @tables = Table.all

    erb :'/tables/table'
  end

  get '/tables/:id' do
  if logged_in?
    @table = Table.find_by_id(params[:id])
    erb :'/tables/show_table'
  else
    redirect '/login'
  end
end


  post '/newtable' do
    @table = Table.create(:table_number => params[:table_number], :head_count => params[:head_count])

    if @table.save
      session[:user_table] = @table.id
      redirect "/tables"
    else
       redirect "/tables"
     end
  end

end
