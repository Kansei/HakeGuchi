class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  rescue_from StandardError, with: :render_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActiveRecord::RecordInvalid, with: :render_422

  def render_404(exception)
    logger.error exception.message
    render json: { error: exception.message }, status: :not_found
  end

  def render_422(exception)
    logger.error exception.message
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  def render_500(exception)
    logger.error exception.message
    render json: { error: exception.message }, status: :internal_server_error
  end
end
