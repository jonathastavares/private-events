class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def attended; end

  def created; end
end
