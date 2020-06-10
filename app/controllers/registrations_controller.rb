# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource(sign_up_params)
    if resource.save
      sign_in(resource)
      head :created
    else
      render_resource(resource)
    end
  end
end
