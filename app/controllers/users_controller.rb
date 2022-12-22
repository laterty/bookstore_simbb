# frozen_string_literal: true

class UsersController < ApplicationController
  def edit; end

  def destroy
    current_user.destroy if permmit_params[:check_delete_user].present?
    redirect_to root_path, notice: I18n.t('users.successful.delete_user')
  end

  private

  def permmit_params
    params.require(:user).permit(:check_delete_user)
  end
end
