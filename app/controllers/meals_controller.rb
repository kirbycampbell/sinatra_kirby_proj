require './config/environment'

class MealsController < ApplicationController

  get '/meals/index' do
    erb :'/meals/meal'
  end

end
