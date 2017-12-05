class Api::V1::MatchesController < ApplicationController



    def create
      current_user = User.find_by(id: params[:currentUserId])
      liked_user = User.find_by(id: params[:id])
      a = current_user.matches.find_or_create_by(match_id: liked_user.id)
      byebug
      b = liked_user.matches.find_by(match_id: current_user.id)

      if b
        a.mutual = true
        b.mutual = true
      end

      render json: liked_user
    end



     private

    # def user_params
    #   params.require(:user).permit(:name, :bio, :username, :gender, :gender_choice, :age, :location, :photo, :interests, :password)
    # end

  end
