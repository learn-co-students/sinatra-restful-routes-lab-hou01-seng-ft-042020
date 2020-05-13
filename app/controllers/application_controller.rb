class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  # code actions here!
  get '/recipes' do 
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do 
    erb :new
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find{ |r| r.id == params[:id].to_i }
    erb :edit 
  end

  patch '/recipes/:id' do 
    @recipe = Recipe.find{ |r| r.id == params[:id].to_i }
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    
    redirect "/recipes/#{@recipe.id}"
  end

  get '/recipes/:id' do 
    @recipe = Recipe.find{ |r| r.id == params[:id].to_i }
    erb :show 
  end 

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find{ |r| r.id == params[:id].to_i }
    @recipe.destroy
    redirect "/recipes"
  end



end
