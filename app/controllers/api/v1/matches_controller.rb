class Api::V1::MatchesController < ApplicationController

    def index
      @matches = Match.all

      render json: @matches
    end

    def create
      current_user = User.find_by(id: params[:currentUserId])
      liked_user = User.find_by(id: params[:id])
      user1 = current_user.matches.find_or_create_by(match_id: liked_user.id)
      user2 = Match.find_by(match_id: current_user.id)
      if Match.is_mutual?(user1, user2)

        Match.set_mutual_status(user1,user2)
      end
      render json: liked_user
    end



     private

    # def user_params
    #   params.require(:user).permit(:name, :bio, :username, :gender, :gender_choice, :age, :location, :photo, :interests, :password)
    # end

  end
