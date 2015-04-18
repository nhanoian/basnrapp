class PlacesController < ApplicationController
  def index
    #define all variables used in views under index
    #@ is an instance variable, if you want to see variable in a view
    @places = Place.all #finds all places, queries model

  end

  def show
    @place = Place.find(params[:id])
  end 

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update(params.require(:place).permit(place_params))
    if @place.save
      redirect_to place_path(@place)
    else
      redirect_to('places/show', notice: "Some shit is fucked up...")
    end
  end

  def delete
  end

  def create
    @place = Place.new(params.require(:place).permit(place_params))
    if @place.save
      redirect_to root_path
    else
      redirect_to('places/new', notice: "You done fucked up!")
    end
  end

  def new
    @place = Place.new
    @notice = params[:notice]
  end
  def place_params
    return [:title, :description, :url, :lat, :long, :completed]
  end
end
