class HomeController < ApplicationController
  def index
    @categories = Category.bookmarked
  end
end
