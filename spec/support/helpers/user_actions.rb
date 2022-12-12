# frozen_string_literal: true

module Helpers
  module UserActions
    def log_in(user)
      visit new_user_session_path
      within '#new_user' do
        fill_in I18n.t('devise.sessions.new.label.email'), with: user.email
        fill_in I18n.t('devise.sessions.new.label.password'), with: user.password
        click_button(I18n.t('devise.sessions.new.log_in'))
      end
    end
  end
end
