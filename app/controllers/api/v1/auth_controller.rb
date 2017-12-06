class Api::V1::AuthController < ApplicationController
  # Neets JWT Token https://jwt.io/
  # Neets JWT gem in gamfile https://github.com/jwt/ruby-jwt
  # generate secret with rake secret
  # Hide the secret by including in your gitignore with figaro gem and replacing in code with ENV['secret']

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
    # issue user a token
      payload = {user_id: user.id}
      token = issue_token(payload)

    # you have to take the user_id and encode it and return to React
    # then store it in localStorage
      render json: { jwt: token, yay: true }
      

    else
      render json: {error: "Could not authorize this user"}, status: 401
    end
  end

  def show
    token = request.headers['Authorization']
    user = User.find_by(id: token)
    if user && user.authenticate(params[:password])
    # issue user a token
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
      render json: {error: "Could not find this user"}, status: 401
    end

  end
end
