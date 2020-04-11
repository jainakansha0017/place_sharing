require 'pry'
class PlacesController < ApplicationController
  def index
    if current_user.nil?
      redirect_to new_user_session_path
    else
      @places = Place.where(user_id: current_user.id).order('created_at DESC')
      @shared_places = current_user.places
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    if @place.geocode && @place.save
      flash[:success] = "Place added!"
      if request.params[:is_public] == "yes"
        User.where.not(id: current_user.id).each do |user|
          @place.users << user
        end
      else
        request.params[:people].each do |user|
          @place.users << User.find(user)
        end
      end
      redirect_to root_path
    else
      flash[:error] = "Address not valid"
      render 'new'
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  private

  def place_params
    params.require(:place).permit(:street, :city, :state, :country)
  end
end
