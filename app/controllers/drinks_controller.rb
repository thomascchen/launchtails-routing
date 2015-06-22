class DrinksController < ApplicationController
  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.new(drink_params)
    if @drink.save
      flash[:notice] = 'Drink added.'
      redirect_to '/drinks'
    else
      render :new
    end
  end

  def index
    if params[:category_id] == nil
      @drinks = Drink.all.page(params[:page])
    else
      @category = Category.find(params[:category_id])
      @drinks = @category.drinks.page(params[:page])
    end
  end

  def destroy
    Drink.find_by(id: params[:id]).destroy
    redirect_to '/drinks'
  end

  protected
  def drink_params
    params.require(:drink).permit(:title, :description, :featured, :category_id, :alcohol_level)
  end
end
