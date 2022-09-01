class UsersController < ApplicationController
  before_action :show, only: [:show]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
