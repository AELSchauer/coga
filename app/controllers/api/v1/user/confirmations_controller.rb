class Api::V1::ConfirmationsController < ApplicationController
  def create
    return four_oh_four("Confirmation token missing") if !confirmation_token
    @user = User.find_by(confirmation_token: confirmation_token)
    return four_oh_four("No user found") if !@user
    if @user.update(confirmation_token: nil, confirmed: true)
      render status: 204
    else
      five_hundred("Unable to update user")
    end
  end

  def confirmation_token
    params.permit(:confirmation_token)
  end
end
