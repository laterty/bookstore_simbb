# frozen_string_literal: true

class UpdateUserEmailsController < ApplicationController
  def update
    @email_form = UpdateUserEmailForm.new(current_user, permitted_params)
    if @email_form.save
      flash[:notice] = I18n.t('users.successful.update_email')
      redirect_to privacy_settings_path
    else
      render 'users/edit'
    end
  end

  private

  def permitted_params
    params.require(:user).permit(:email)
  end
end
