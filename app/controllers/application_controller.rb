# frozen_string_literal: true

class ApplicationController < ActionController::Base  # not ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name country_name city region timezone_offset])
  end
end
