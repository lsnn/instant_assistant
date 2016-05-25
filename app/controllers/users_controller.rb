class UsersController < ApplicationController

  before_filter :set_user

  def index
    # overview of all assistants
  end

  def show
    @user
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

  private

  def set_user
    @user = Uber::Client.new do |config|
      config.server_token  = "uHf5yHFbjoE11qRnJW8pN8S98EX79hUc_xXPS4iW"
    end
  end

end
