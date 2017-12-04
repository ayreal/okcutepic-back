class Api::V1::AuthController < ApplicationController
  # Neets JWT Token https://jwt.io/
  # Neets JWT gem in gamfile https://github.com/jwt/ruby-jwt
  # generate secret with rake secret
  # Hide the secret by including in your gitignore with figaro gem and replacing in code with ENV['secret']

def create
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
  # issue user a token
    render json: {
      id: user.id,
      username:user.username,
      gender_choice: user.gender_choice,
      interests: user.interests,
      matches: user.matches,
      location: user.location
    }
  else
    render json: {error: "User not found"}, status: 401
  end
end
#
# def show
#   if logged_in?
#     # render json for current users
#   else
#     # render json error
# end
#
end
