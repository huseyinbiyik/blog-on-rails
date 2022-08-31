class UsersController < ApplicationController
  before_action :show, only: [:show]
  def index
    @users = User.all
  end

  def show; end
end
