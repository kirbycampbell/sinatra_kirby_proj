require './config/environment'

class TablesController < ApplicationController

  get '/tables' do
    erb :'/tables/table'
  end

end
