# require 'jwt'
class Api::V1::AuthController < ApplicationController

  # Neets JWT gem in gamfile https://github.com/jwt/ruby-jwt
  # generate secret with rake secret
  # Hide the secret by including in your gitignore with figaro gem and replacing in code with ENV['secret']

  def create

    user = User.find_by(username: params[:auth][:username])
    if user && user.authenticate(params[:auth][:password])
      # byebug
    # issue user a token
      payload = {user_id: user.id}
      # NameError (uninitialized constant Api::V1::AuthController::JWT):
      token = issue_token(payload)

    # you have to take the user_id and encode it and return to React
    # then store it in localStorage
      render json: { token: token , currentUser: user}


    else
      render json: {error: "Could not authorize this user"}, status: 401
    end
  end

  def show
    token = request.headers['Authorization']
    decoded_token =  JWT.decode(token, ENV['MY_SECRET'], true, { :algorithm => ENV['AYREAL'] })
    # => [{"user_id"=>23}, {"alg"=>"HS256"}]
    user_id = decoded_token.first['user_id']
    user = User.find_by(id: user_id)
    if user
      render json: {
        id: user.id,
        name: user.name,
        username:user.username,
        gender_choice: user.gender_choice,
        interests: user.interests,
        matches: user.matches,
        location: user.location
      }
    else
      render json: {error: "Could not find this user. Username or password is incorrect."}, status: 401
    end

  end
end
