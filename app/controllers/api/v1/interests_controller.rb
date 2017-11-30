class Api::V1::InterestsController < ApplicationController

  def index
    @interests = Interest.all
    render json: @interests
  end

  def create
    @interest = Interest.find_or_create_by(name: params[:name])
  end

  private
  def user_params
    params.permit(:name)
  end
end
