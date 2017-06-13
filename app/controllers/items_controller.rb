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



  private
  def item_params
    params.require(:item).permit(:name, :img_url)
  end
end
