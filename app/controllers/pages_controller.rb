class PagesController < ApplicationController
  def home
  	@comics = Comic.all
  end

  def about
  end

  def contact
  end
end
