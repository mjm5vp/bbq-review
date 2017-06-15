class LocationsController < ApplicationController



  # new
  def new
    if current_user
      @city = City.find(params[:city_id])
      @item = @city.items.find(params[:item_id])
      @location = @item.locations.new
    else
      redirect_to new_user_session_path, alert: "You need to sign in to do this."
    end
  end

  # create
  def create
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:item_id])
    @location = @item.locations.new(location_params)
    if @location.save
      redirect_to city_item_location_path(@city, @item, @location), notice: "Location was successfully created."
    else
      redirect_to new_city_item_location_path, alert: "Location not saved.  Please fill in all fields."
    end
  end

  #show
  def show
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:item_id])
    @location = @item.locations.find(params[:id])
    # @favs = current_user.locations
    @comments = @location.comments
  end

  # edit
  def edit
    if current_user
      @city = City.find(params[:city_id])
      @item = @city.items.find(params[:item_id])
      @location = @item.locations.find(params[:id])
    else
      redirect_to new_user_session_path, alert: "You need to sign in to do this."
    end
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

  def add_gold
    if current_user
      @city = City.find(params[:city_id])
      @item = @city.items.find(params[:item_id])
      @locations = @item.locations
      @location = @item.locations.find(params[:id])
      @locations.each do |location|
        @old_gold = Favorite.find_by(user: current_user, medal: 1, location: location)
        puts "OLD GOLD IS: #{@old_gold}"
        if @old_gold
          @old_gold.destroy
        end
      end

      @old_medal = Favorite.find_by(user: current_user, location: @location)
      if @old_medal
        @old_medal.destroy
      end
      @gold = Favorite.create!(location: @location, user: current_user, medal: 1)
      redirect_back(fallback_location: city_item_path(@city,@item))
    else
      redirect_to new_user_session_path, alert: "You need to sign in to do this."
    end
  end

  def add_silver
    if current_user
      @city = City.find(params[:city_id])
      @item = @city.items.find(params[:item_id])
      @locations = @item.locations
      @location = @item.locations.find(params[:id])

      @locations.each do |location|
        @old_silver = Favorite.find_by(user: current_user, medal: 2, location: location)
        if @old_silver
          @old_silver.destroy
        end
      end

      @old_medal = Favorite.find_by(user: current_user, location: @location)
      if @old_medal
        @old_medal.destroy
      end

      @silver = Favorite.create!(location: @location, user: current_user, medal: 2)
      redirect_back(fallback_location: city_item_path(@city,@item))
    else
      redirect_to new_user_session_path, alert: "You need to sign in to do this."
    end
  end

  def add_bronze
    if current_user
      @city = City.find(params[:city_id])
      @item = @city.items.find(params[:item_id])
      @locations = @item.locations
      @location = @item.locations.find(params[:id])

      @locations.each do |location|
        @old_bronze = Favorite.find_by(user: current_user, medal: 3, location: location)
        if @old_bronze
          @old_bronze.destroy
        end
      end

      @old_medal = Favorite.find_by(user: current_user, location: @location)
      if @old_medal
        @old_medal.destroy
      end

      @bronze = Favorite.create!(location: @location, user: current_user, medal: 3)
      redirect_back(fallback_location: city_item_path(@city,@item))
    else
      redirect_to new_user_session_path, alert: "You need to sign in to do this."
    end
  end
  #
  def remove_favorite
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:item_id])
    @locations = @item.locations
    @location = @item.locations.find(params[:id])
    @favorite = current_user.favorites.find_by(location: @location)
    @favorite.destroy
    redirect_back(fallback_location: city_item_path(@city,@item))
    # redirect_to :back
    # redirect_to city_item_path(@location.item_id.city, @location.item)
  end

  private
  def location_params
    params.require(:location).permit(:name, :img_url)
  end
end
