class StatusController < ApplicationController
  def index
    render status: 204, json: {}
  end
end
