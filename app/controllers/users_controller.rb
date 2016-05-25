class UsersController < ApplicationController

  def index
    # overview of all assistants
  end

  def show
    # see your own profile
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      redirect_to new_user_path
    end
  end
end
