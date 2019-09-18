# frozen_string_literal: true

class Event < ApplicationRecord
  validates :name, :time_zone, :repeats, :category, :start_datetime, :duration, presence: true
end
