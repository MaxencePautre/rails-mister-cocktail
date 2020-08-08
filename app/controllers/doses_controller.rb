class DosesController < ApplicationController

  def show

  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:dose][:ingredient])
    dose = Dose.new(doses_params)
    dose.cocktail = @cocktail
    dose.ingredient = @ingredient
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
  end

  private

  def doses_params
    params.require(:dose).permit(:description)
  end
end
