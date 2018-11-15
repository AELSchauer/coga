class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(primary_email: session_params[:email]) ||
           User.find_by(username: session_params[:username])
    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      render status: 200, json: user.login_attributes.merge({ token: user.json_web_token })
    else
      render status: 404, json: { message: "Login credentials invalid" }
    end
  end

  private

  def session_params
    params.require(:session).permit(:username, :email, :password)
  end
end
