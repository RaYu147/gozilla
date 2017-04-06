class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :set_layout

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  include ErrorHandlers if Rails.env.production?
  #
  # rescue_from Exception, with: :rescue500
  # rescue_from Forbidden, with: :rescue403
  # rescue_from IpAddressRejected, with: :rescue403
  # rescue_from ActionController::RoutingError, with: :rescue404
  # rescue_from ActiveRecord::RecordNotFound,with: :rescue404

  private
  def set_layout
    if params[:controller].match(%r{\A(staff|admin)/})
      Regexp.last_match[1]
    else
      'errors'
    end
  end

  # def rescue403(e)
  #   @exception = e
  #   render 'errors/forbidden', status: 403
  # end
  #
  # def rescue404(e)
  #   @exception = e
  #   render 'errors/not_found', status: 404
  # end
  #
  # def rescue500(e)
  #   @exception = e
  #   render 'errors/internal_server_error', status: 500
  # end


end