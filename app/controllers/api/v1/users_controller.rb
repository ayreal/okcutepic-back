class Api::V1::UsersController < ApplicationController


    def index
      @users = User.all
      render json: @users.to_json(include: [:interests, :matches])
    end

    def create
      @user = User.create(user_params)
      params["user"]["interests"].each do |interest|
        @user.interests << Interest.find_or_create_by(name: interest)
      end
      payload = {:access_token => "cats"}
      token = JWT.encode(payload, ENV["MY_SECRET"], ENV["AYREAL"])
      @user.update(access_token: token)
      @user.save
      render json: @user
    end

    def show
      @user = User.find_by(id: params[:id])
      @mutual = @user.matches.where(mutual: true)
      @matches = @mutual.map do |match|
        User.find_by(id: match.match_id)
      end
      render json: @matches
    end

    def update
      @user = User.find(params[:id])

      @user.update(user_params)
      if @user.save
        render json: @user
      else
        render json: {errors: @user.errors.full_messages}, status: 422
      end
    end

    private
    def user_params
      params.require(:user).permit(:name, :bio, :username, :gender, :gender_choice, :age, :location, :photo, :interests, :password, :avatar)
    end

  end
