class RecipesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]
  
  def create
    @recipe = current_user.recipes.build(params[:recipe])
    if @recipe.save
      flash[:success] = "Your recipe has been added!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end
  
  def destroy
  end
end