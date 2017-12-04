class Api::V1::InterestsController < ApplicationController

  def index
    @interests = Interest.all
    render json: @interests
  end

  def create
    params["_json"].each do |interest|
      @interest = Interest.find_or_create_by(name: interest)
      render json: @interest
    end
  end

  private
  def user_params
    params.require(:interests).permit(:name)
  end
end
