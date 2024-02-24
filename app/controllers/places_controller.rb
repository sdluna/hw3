class PlacesController < ApplicationController
  
  # Page with list of places
  def index 
    @places = Place.all
  end

  # Form to create a new place
  def new
  end

  #allow new data to be created
  def create
    @place=Place.new
    @place["name"]=params["name"]
    @place.save 
    redirect_to "/places"
  end

  # Display one individual place
  def show
    @place = Place.find_by({"id" => params["id"]})
    #find entries for this place
    @entries = Entry.where({ "place_id" => @place["id"] })
  end

end
