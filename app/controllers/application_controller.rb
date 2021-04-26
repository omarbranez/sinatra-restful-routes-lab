class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
    # index action through @recipes
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
    # new action, along with lines 19-21
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
    # show action
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    # @recipe.name = params[:name]
    # @recipe.ingredients = params[:ingredients]
    # @recipe.cook_time = params[:cook_time]
    @recipe.update(params[:recipe])
    # @recipe.save
    redirect to "/recipes/#{@recipe.id}"
    #edit action, along with 35-38
  end

  delete '/recipes/:id' do
    Recipe.find(params[:id]).destroy
    redirect to '/recipes'
  end


end
