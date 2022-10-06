class HomeController < ApplicationController
  def index
    @news=News.homenews
    @events=Event.homeevents

  end
end
