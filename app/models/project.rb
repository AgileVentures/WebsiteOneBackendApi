# frozen_string_literal: true

class Project < ApplicationRecord
  validates :status,      presence: true
  validates :description, presence: true
  validates :title,       presence: true
end
