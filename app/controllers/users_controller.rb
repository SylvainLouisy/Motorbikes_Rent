class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_motorbikes = @user.motorbikes
  end
end
