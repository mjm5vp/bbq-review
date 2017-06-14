class ItemsController < ApplicationController
  # index
  def index
    @items = Item.all
  end

  # new
  def new
    if current_user
      @city = City.find(params[:city_id])
      @item = @city.items.new
    else
      redirect_to new_user_session_path, alert: "You need to log in to do this."
    end
  end

  # create
  def create
    @city = City.find(params[:city_id])
    @item = @city.items.new(item_params)
    if @item.save
      redirect_to city_path(@city), notice: "Item was successfully created."
    else
      redirect_to new_city_item_path, alert: "Item not saved.  Please fill in all fields."
    end
  end

  #show
  def show
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:id])
    @locations = @item.locations

    @locations.each do |location|
      location.gold = Favorite.where(location: location, medal: 1).count
      location.silver = Favorite.where(location: location, medal: 2).count
      location.bronze = Favorite.where(location: location, medal: 3).count
      location.total_score = (location.gold * 3) + (location.silver * 2) + (location.bronze)
      location.total_votes = location.gold + location.silver + location.bronze
    end

    @sorted_locations = @locations.sort_by do |location|
      [location.total_score, location.total_votes]
    end

    @sorted_locations.reverse!



  end

  # edit
  def edit
    @city = City.find(params[:city_id])
    @item = Item.find(params[:id])
  end

  # update
  def update
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:id])
    @item.update(item_params)
    redirect_to city_item_path(@item.city, @item)
  end

  # destroy
  def destroy
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:id])
    @item.destroy
    redirect_to city_path(@city)
  end



  private
  def item_params
    params.require(:item).permit(:name, :img_url)
  end
end
