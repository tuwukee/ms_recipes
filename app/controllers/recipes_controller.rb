class RecipesController < ApplicationController
  def index
    @recipes = ms_service.get_recipes
  end

  def show
    @recipe = ms_service.get_recipe(params[:id])

    if @recipe.nil?
      render :file => "#{Rails.root}/public/404.html",  layout: false, status: :not_found
    end
  end

  private

  def ms_service
    @ms_service ||= MsService.new
  end
end
