class EventsController < ApplicationController
  def index
    @events = Event.all
    render json: @events, status: 200
  end
end
