class StaticPagesController < ApplicationController
  
  def home
    @gossips = Gossip.all
  end

  def index
  end
  
  def team
  end

  def contact
  end

  def welcome
    @name = params[:anything]
  end

  def gossip
    @gossip = Gossip.find(params[:id])
  end

  def user
    @user = User.find(params[:id])
    @city = City.find(@user.city_id)
  end


end
