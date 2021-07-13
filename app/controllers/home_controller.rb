class HomeController < ApplicationController
  before_action :h_votes
  def index
    @categories = Category.includes(:articles).order(:priority)
    @high_voted = Article.find_by_id(h_votes)
  end
end
