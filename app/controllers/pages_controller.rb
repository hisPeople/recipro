class PagesController < ApplicationController
  def home
    @title = 'Home'
    @recipe = Recipe.new if signed_in?
  end

  def contact
    @title = 'Contact'
  end

  def about
    @title = 'About'
  end
  
  def help
    @title = 'Help'
  end
  
  def news
    @title = "News"
  end

end
