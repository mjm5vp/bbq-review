class CommentsController < ApplicationController
  def index
  end

  def show
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:item_id])
    @location = @item.locations.find(params[:location_id])
  end

  def new
    if current_user
      @city = City.find(params[:city_id])
      @item = @city.items.find(params[:item_id])
      @location = @item.locations.find(params[:location_id])
      @comment = @location.comments.new
    else
      redirect_to new_user_session_path, alert: "You need to sign in to do this."
    end
  end

  def create
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:item_id])
    @location = @item.locations.find(params[:location_id])
    @comment = @location.comments.new(comment_params)
    if @comment.save
      redirect_to city_item_location_path(@city, @item, @location), notice: "Comment was successfully created."
    else
      redirect_to new_city_item_location_path, alert: "Comment not saved.  Please fill in all fields."
    end

  end

  def edit
    if current_user
      @city = City.find(params[:city_id])
      @item = @city.items.find(params[:item_id])
      @location = @item.locations.find(params[:location_id])

    else
      redirect_to new_user_session_path, alert: "You need to sign in to do this."
    end
  end

  # update
  def update
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:item_id])
    @location = @item.locations.find(params[:location_id])
    @comment = @location.comments.find(params[:id])
    @comment.update(comment_params)
    redirect_to city_item_path(@city, @item)
  end

  # destroy
  def destroy
    @city = City.find(params[:city_id])
    @item = @city.items.find(params[:item_id])
    @location = @item.locations.find(params[:location_id])
    @comment = @location.comments.find(params[:id])
    # @tag = @location.tags.find_by(item: @item)
    # @tag.destroy
    @comment.destroy
    redirect_to city_item_location_path(@city,@item,@location)
  end

  private
  def comment_params
    params.require(:comment).permit(:text)
  end

end
