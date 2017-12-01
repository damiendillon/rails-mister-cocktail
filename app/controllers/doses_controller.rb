class DosesController < ApplicationController

  before_action :find_cocktail, :dose_params

  def index
  end

  def new
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    # this gets the cocktail id
    # this gets the cocktails object
    @cocktail = Cocktail.find(params[:id])

    @dose = Dose.new(dose_params)
    # this links our cocktail object to our dose, effectively storing cocktail_id
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@coctail)
    else
      render :new
    end
  end

  private

  def find_cocktail
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
