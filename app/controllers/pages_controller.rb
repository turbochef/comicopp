class PagesController < ApplicationController
  def home
  	@newest = Comic.all.order('created_at DESC')
  end

  def about
  end

  def contact
  end
end
