# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  respond_to :json
  protect_from_forgery with: :null_session

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

  def create
    build_resource(sign_up_params)
    resource.save
    sign_in(resource)

    if resource.errors.empty?
      render json: resource
    else
      validation_error(resource)
    end
  end
end
