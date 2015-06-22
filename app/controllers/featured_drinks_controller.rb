class FeaturedDrinksController < ApplicationController
  def index
    @drinks = Drink.featured.page(params[:page])
  end
end
