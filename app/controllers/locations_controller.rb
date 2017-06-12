class LocationsController < ApplicationController
  # index
  # def index
  #   @items = Item.all
  # end

  # new
  def new
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:item_id])
    @location = @item.locations.new
  end

  # create
  def create
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:item_id])
    @location = @item.locations.create(location_params)
    redirect_to city_item_path(@city, @item)
  end

  #show
  def show
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:item_id])
    @location = @item.locations.find(params[:id])
    @comments = @location.comments
  end

  # edit
  def edit
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:item_id])
    @location = @item.locations.find(params[:id])
  end

  # update
  def update
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:item_id])
    @location = @item.locations.find(params[:id])
    @location.update(location_params)
    redirect_to city_item_path(@city, @item)
  end

  # destroy
  def destroy
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:item_id])
    @location = @item.locations.find(params[:id])
    @tag = @location.tags.find_by(item: @item)
    @tag.destroy
    @location.destroy
    redirect_to city_item_path(@city,@item)
  end

  # def add_favorite
  #   @song = Song.find(params[:id])
  #   @favorite = Favorite.create!(song: @song, user: current_user)
  #   # @favorite = current_user.favorites.create!(song: @song)
  #   # @favorite = @song.favorites.create!(user: current_user)
  #   # redirect_to artist_path(@song.artist)
  #   redirect_to :back
  # end
  #
  # def remove_favorite
  #   @song = Song.find(params[:id])
  #   @favorite = current_user.favorites.find_by(song: @song)
  #   @favorite.destroy
  #   redirect_to :back
  # end

  private
  def location_params
    params.require(:location).permit(:name, :img_url)
  end
end
