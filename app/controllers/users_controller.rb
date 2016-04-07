class UsersController < ApplicationController
  before_action :authenticate_user!
  after_action :verify_authorized

  def index
    @users = User.includes(:labels).all
    authorize User
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  def update_labels
    user = User.find(params[:id])
    authorize user

    if user.update_attributes(secure_params)
      flash[:notice] = "Labels updated."
    else
      flash[:alert] = "Unable to update labels."
    end

    redirect_to users_path
  end

  private

  def secure_params
    params.require(:user).permit(:role, label_ids: [])
  end

end
