class Api::V1::MissionsController < ApplicationController
  def index
    @missions = Mission.all
    render json: @missions
  end
end
