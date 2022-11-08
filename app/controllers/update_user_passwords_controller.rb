class UpdateUserPasswordsController < ApplicationController
  def update
    @password_form = UpdateUserPasswordForm.new(current_user, permitted_params)
    if @password_form.save
      flash[:notice] = 'Password was successfully changed!'
      redirect_to new_user_session_path
    else
      render :edit
    end
  end

  private

  def permitted_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
