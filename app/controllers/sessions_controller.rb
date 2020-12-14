# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  respond_to :json
  protect_from_forgery with: :null_session
  
  private

  def respond_with(resource, _opts={})
    render json: resource
  end

  def respond_to_on_destroy
    head :no_content
  end
end
