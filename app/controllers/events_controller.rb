class EventsController < ApplicationController
  def index
    @events=Event.all.limitnb(params[:page])
  end

  def show
    @event=Event.find_by_url(params[:title])
  end
end
