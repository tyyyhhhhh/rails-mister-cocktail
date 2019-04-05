class CocktailsController < ApplicationController

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new
    @cocktail.name = params[:cocktail][:name]

    if @cocktail.save
      redirect_to @cocktail
    else
      render :new
    end
    # else
    #   render :new
    # end
  end

private
  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end

end
