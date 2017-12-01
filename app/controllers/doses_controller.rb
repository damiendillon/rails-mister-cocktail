class DosesController < ApplicationController

  before_action :find_cocktail, except: [:destroy]

  def index
  end

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    #{"description"=>"slice", "ingredient_id"=>"1"}
    @dose = Dose.new(dose_params)
    # This dose has the id of this cocktail and can be saved now
    @dose.cocktail = @cocktail            # = Cocktail.find(params[:cocktail_id])
    # this links our cocktail object to our dose, effectively storing cocktail_id
    if @dose.save
      redirect_to cocktail_path(@cocktail), notice: 'Ingredient was successfully added.'
    else
      redirect_to cocktail_path(@cocktail), notice: 'There was an issue trying to save your ingredient.'
    end
  end

  def destroy
    #calling it on the Dose model
    @dose = Dose.find(params[:id])
    # Used in the redirection but after @dose.destroy you have lost the dose and cannot find it
    @cocktail = Cocktail.find(@dose.cocktail_id)  # = @dose.cocktail
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def find_cocktail
    # this gets the cocktails object
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
