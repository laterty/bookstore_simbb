class UpdateUserEmailsController < ApplicationController
  def update
    @email_form = UpdateUserEmailForm.new(current_user, permitted_params)
    if @email_form.save
      flash[:notice] = 'Email was successfully changed!'
      redirect_to privacy_settings_path
    else
      flash[:notice] = 'Something went wrong'
      render :edit
    end
  end

  private

  def permitted_params
    params.require(:user).permit(:email)
  end
end
