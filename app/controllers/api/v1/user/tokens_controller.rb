class Api::V1::TokensController < ApplicationController
  before_action :authorize!

  def create
    render status: 200, json: current_user.login_attributes.merge({ token: current_user.token })
  end
end
