class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:subscribed]
  def home
  	@newest = Comic.all.order('created_at DESC')
  end

  def subscribed
  	@subscribed = current_user.followees(User)
  	@subscribed_comics = Comic.where(user: @subscribed).all
  end

  def new
  	@newest = Comic.all.order('created_at DESC')
  end

  def popular
  	@popular = Comic.order("cached_votes_score DESC")
  end

  def about
  end

  def contact
  end

end
