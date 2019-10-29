# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.all
    render json: @events, status: 200
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def update
    @event = Event.find_by(id: params[:id])
    if @event.update(event_params)
      render json: @event, status: :ok
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find_by!(id: params[:id])
    render json: @event
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    head 204
  end

  private

  def event_params
    params.require(:event).permit(:name, :time_zone, :repeats, :category, :start_datetime, :duration)
  end
end
