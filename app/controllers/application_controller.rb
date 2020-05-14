class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!
  get '/' do
    "Welcome Recipes World~!!"
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all 
    erb :index
  end

  get '/recipes/:id' do
    @recipe = this_recipe
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = this_recipe
    erb :edit
  end

  post '/recipes' do
    recipe = Recipe.create(params)
    redirect "/recipes/#{recipe.id}"
  end

  patch '/recipes/:id' do
    recipe = this_recipe
    recipe.update(params)
    redirect "recipes/#{recipe.id}"
  end

  delete '/recipes/:id' do
    @recipe = this_recipe
    @recipe.destroy
    redirect "/recipes"
  end

  def this_recipe
    @recipe = Recipe.find(params[:id])
  end

end
