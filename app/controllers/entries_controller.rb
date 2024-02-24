class EntriesController < ApplicationController

  def show
    @entry = Entry.find_by({"id" => params["id"]})
    @place = Place.find_by({"id" => @entry["place_id"]})
    # render entries/show view with details about entries for that place
  end

  def new
    @place = Place.find_by({"id" => params["place_id"]})
    # render entries/new view with new Entry form
  end

  def create
    #new entry
    @entry=Entry.new 
    #data we enter
    @entry["title"]=params["title"]
    @entry["description"]=params["description"]
    #@entry["date"]=params["date"]
    #tie to place
    @entry["place_id"]=params["place_id"]
    #save
    @entry.save
    #redirect
    redirect_to "/places/#{params["place_id"]}"
  end 


end
