# frozen_string_literal: true

class GraphqlController < ApplicationController
  before_action :fetch_params, only: [:execute]
  skip_before_action :verify_authenticity_token

  def execute
    result = WebsiteOneBackendApiSchema.execute(
      params[:query],
      variables: @variables,
      context: {}, # for example, current_user
      operation_name: @operation_name
    )
    render json: result

  rescue StandardError => e
    raise e unless Rails.env.development?
    handle_error_in_development e
  end

  private

  def fetch_params
    @variables = ensure_hash(params[:variables])
    @operation_name = params[:operationName]
  end

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      ambiguous_param.present? ? ensure_hash(JSON.parse(ambiguous_param)) : {}
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  def handle_error_in_development(e)
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render json: { error: { message: e.message, backtrace: e.backtrace }, data: {} }, status: :internal_server_error
  end
end
