class ApplicationController < ActionController::API
  def issue_token(payload)
    JWT.encode(payload, ENV["MY_SECRET"], ENV["AYREAL"])
  end

  # def current_user
  #   @user ||= User.find_by(id: user_id)
  # end
  #
  # def decoded_token
  #   begin
  #     # [{user_id: 1}, {algo: 'hs256'}]
  #     JWT.decode(token, ENV["MY_SECRET"], true, { :algorithm => ENV["AYREAL"] })
  #   rescue JWT::DecodeError
  #     [{}]
  #   end
  # end
  #
  #   def user_id
  #     decoded_token.first['user_id']
  #   end
  #
  #
  # def logged_in?
  #   !!current_user
  # end

end
