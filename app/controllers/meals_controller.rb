require './config/environment'

class MealsController < ApplicationController

  get '/meals' do
    erb :'/meals/meal'
  end

  post '/newmeal' do
    @meal = Meal.create(:dish_name => params[:dish_name], :cook_time => params[:cook_time], :price => params[:price], :available? => true)
    if @meal.save
      redirect "/tables/<%=@table.id%>"
    else
       redirect "/meals"
     end
  end

end
