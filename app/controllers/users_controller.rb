class UsersController < ApplicationController
  def edit; end

  def destroy
    current_user.destroy if permmit_params[:check_delete_user]
    redirect_to root_path, notice: 'User was successfully deleted'
  end

  private

  def permmit_params
    params.require(:user).permit(:check_delete_user)
  end
end
