# frozen_string_literal: true

class Event < ApplicationRecord
  include ActiveModel::Serializers::JSON

  validates :name, :time_zone, :repeats, :category, :start_datetime, :duration, presence: true
  # rubocop:disable Metrics/AbcSize
  def attributes
    { id: id, name: name, description: description, category: category, start_datetime: start_datetime,
      repeats: repeats, repeat_ends: repeat_ends, repeats_every_n_weeks: repeats_every_n_weeks,
      repeat_ends_on: repeat_ends_on, time_zone: time_zone, created_at: created_at, project_id: project_id,
      updated_at: updated_at, url: url, slug: slug, duration: duration, exclusions: exclusions, for: self[:for],
      creator_attendance: creator_attendance,  creator_id: creator_id, modifier_id: modifier_id,
      repeats_weekly_each_days_of_the_week_mask: repeats_weekly_each_days_of_the_week_mask
    }
  end
  # rubocop:enable Metrics/AbcSize
end
