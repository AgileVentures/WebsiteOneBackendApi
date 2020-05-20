# frozen_string_literal: true

class Project < ApplicationRecord
  validates_presence_of :status,      presence: true
  validates_presence_of :description, presence: true
  validates_presence_of :title,       presence: true
end
