# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from ActiveRecord::RecordNotFound do |e|
    render json: { error: e.message }, status: :not_found
  end

  def render_resource(resource)
    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end

  def validation_error(resource)
    render json: {
      errors: [
        {
          status: '400',
          title: 'Bad Request',
          detail: resource.errors,
          code: '100'
        }
      ]
    }, status: :bad_request
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end
end
