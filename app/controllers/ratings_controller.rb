class RatingsController < ApplicationController

  def create
    @rating = @beer.ratings.new(value: params[:value], user_id: current_user.id)
    # @rating.beer = Beer.find(params[:beer_id])
    # @rating.user = current_user
    if @rating.save
      flash[:success] = "Thanks for your input! Your rating has been stored!"
      redirect_to beer_path(params[:beer_id])
    else
      flash[:failure] = "Please select a rating before hitting submit"
    end
  end

  def update
    @rating = Rating.find(params[:id])
    @rating.update_attribute :value, params[:value]

private

  def set_beer
    @beer = Beer.find(params[:beer_id])
  end

end
