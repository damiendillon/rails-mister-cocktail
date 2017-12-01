class CocktailsController < ApplicationController
    before_action :set_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    @cocktail.save
    redirect_to cocktail_path(@cocktail)
  end

  def new
    @cocktail = Cocktail.new
  end

  def edit
  end

  def show
    #The view cant do anything without variables in which to store the info in, or print from
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cocktail
      @cocktail = Cocktail.find(params[:id])
    end

    def cocktail_params
      params.require(:cocktail).permit(:name)
    end
end
