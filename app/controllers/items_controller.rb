class ItemsController < ApplicationController
  # index
  def index
    @items = Item.all
  end

  # new
  def new
    @city = City.find(params[:city_id])
    @item = @city.items.new
  end

  # create
  def create
    @city = City.find(params[:city_id])
    @item = @city.items.create(item_params)
    redirect_to city_path(@city)
  end

  #show
  def show
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:id])
    @locations = @item.locations
  end

  # edit
  def edit
    @city = City.find(params[:city_id])
    @item = Item.find(params[:id])
  end

  # update
  def update
    @city = City.find(params[:city_id])
    @item = @city.find(params[:id])
    @item.update(item_params)
    redirect_to city_item_path(@item.city, @item)
  end

  # destroy
  def destroy
    @city = City.find(params[:city_id])
    @item = @city.find(params[:id])
    @item.destroy
    redirect_to items_path
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
  def item_params
    params.require(:item).permit(:name, :img_url)
  end
end
