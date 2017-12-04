class Api::V1::UsersController < ApplicationController


    def index
      @users = User.all
      render json: @users.to_json(include: [:interests, :matches])
    end

    def create
      @user = User.create(user_params)

      params["interests"].each do |interest|
        @user.interests << Interest.find_or_create_by(name: interest)
      end
      @user.save
      render json: @user
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
      params.require(:user).permit(:name, :bio, :username, :gender, :gender_choice, :age, :location, :photo, :interests, :password)
    end

  end
