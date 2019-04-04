class DosesController < ApplicationController
  def index
    @doses = Dose.all
  end

  def show
    @cocktail = Cocktail.find(params[:cocktail_id])
    @doses = @cocktail.doses
  end

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    # raise
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient = Ingredient.new
    @dose = Dose.new(dose_params)
    @dose.cocktail_id = @cocktail.id
    # @dose.ingredient_id = @ingredient.id
    if @dose.save
      redirect_to @cocktail
    else
      render :new
    end


  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to @dose.cocktail
  end

private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
