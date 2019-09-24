class EventsController < ApplicationController
  def index
    @events = Event.all
    render json: @events, status: 200
  end

  def create
    Event.create(event_params)
    render status: 200
  end

  private
  def event_params
    params.require(:event).permit(:name, :time_zone, :repeats, :category, :start_datetime, :duration)
  end
end
