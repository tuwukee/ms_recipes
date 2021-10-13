class RecipesController < ApplicationController
  before_action :init_ms_service, only: [:index, :show]

  def index
    @recipes = @ms_service.get_recipes
  end

  def show
    @recipe = @ms_service.get_recipe(params[:id])
  end

  private

  def init_ms_service
    @ms_service = MsApiService.new
  end
end
