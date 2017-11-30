class Api::V1::AuthController < ApplicationController

def create
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    render json {id: user.id, username:user.username}
  else
    render json: {error: "user not found"}, status: 401
end

def show
  if logged_in?
    # render json for current users
  else
    # render json error
end

end
