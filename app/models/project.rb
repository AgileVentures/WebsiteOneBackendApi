# frozen_string_literal: true

class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :history]

  validates :status,      presence: true
  validates :description, presence: true
  validates :title,       presence: true

  has_many :source_repositories, dependent: :destroy
  accepts_nested_attributes_for :source_repositories, reject_if: :all_blank, allow_destroy: true

  private

  def should_generate_new_friendly_id?
    # Used by the friendly_id gem
    changes.include?(:title)
  end
end
