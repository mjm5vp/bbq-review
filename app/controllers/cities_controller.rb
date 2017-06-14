class CitiesController < ApplicationController
  # index
  def index
    @cities = City.all
  end

  # new
  def new
    if current_user
      @city = City.new
    else
      redirect_to new_user_session_path, alert: "You need to log in to do this."
    end
  end

  # create
  def create
    @city = City.new(city_params)
    if @city.save
      redirect_to cities_path, notice: "City was successfully saved."
    else
      redirect_to new_city_path, alert: "City was not successfully saved."
    end
  end

  #show
  def show
    @city = City.find(params[:id])
    @items = @city.items
  end

  # edit
  def edit
    @city = City.find(params[:id])
  end

  # update
  def update
    @city = City.find(params[:id])
    @city.update(city_params)
    redirect_to city_path(@city)
  end

  # destroy
  def destroy
    @city = City.find(params[:id])
    @city.destroy
    redirect_to cities_path
  end

  private
  def city_params
    params.require(:city).permit(:name, :img_url)
  end

end
