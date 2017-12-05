class Api::V1::InterestsController < ApplicationController

  def index
    @interests = Interest.all
    render json: @interests
  end

  def create
    @arr =[]
    params["_json"].each do |interest|
      @interest = Interest.find_or_create_by(name: interest)
      @arr << @interest
    end
    render json: @arr
  end

  private
  def user_params
    params.require(:interests).permit(:name)
  end
end
