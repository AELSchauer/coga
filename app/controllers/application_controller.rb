class ApplicationController < ActionController::API
  def current_user
    id = data[:id] || session[:user_id]
    @current_user ||= User.find(id) if id
  end

  def current_permission
    @current_permission ||= Permission.new(current_user)
  end

  def authorized?
    current_permission.allow?(params[:controller], params[:action])
  end

  def authorize!
    session[:user_id] = data[:id]
    unless authorized?
      render status: 400, json: { message: "Authorization token invalid" }
    end
  end

  private

  def auth_token
    request.headers['Authorization']
  end

  def data
    JsonWebToken.decode(auth_token) || {}
  end
end
