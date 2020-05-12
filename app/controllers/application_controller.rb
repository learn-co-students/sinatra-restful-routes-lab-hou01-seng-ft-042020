class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    "<h1>Welcome to your recipes</h1>"
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes/new' do
    redirect "/recipes/new"
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  post '/recipes' do
    rec = Recipe.create(params)
    redirect "/recipes/#{rec.id}"
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  post '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    redirect "/recipes/#{@recipe.id}/edit"
  end

  patch '/recipes/:id' do
    rec = Recipe.find(params[:id])
    rec.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{rec.id}"
  end

  delete '/recipes/:id' do
    Recipe.delete(params[:id])
    redirect "/recipes"
  end
end
