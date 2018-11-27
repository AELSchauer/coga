class StatusController < ApplicationController
  def index
    render status: 204
  end
end
