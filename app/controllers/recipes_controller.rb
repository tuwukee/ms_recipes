class RecipesController < ApplicationController
  before_action :init_ms_service, only: [:index, :show]

  def index
    @recipes = @ms_service.get_recipes
  end

  def show
    @recipe = @ms_service.get_recipe(params[:id])

    if @recipe.nil?
      raise ActionController::RoutingError.new("Not found")
    end
  end

  private

  def init_ms_service
    @ms_service = MsApiService.new
  end
end
