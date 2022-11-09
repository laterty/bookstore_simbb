class UpdateUserEmailForm < ApplicationForm
  attr_accessor :email

  EMAIL_REGEXP = URI::MailTo::EMAIL_REGEXP

  validates :email, 
    presence: true, 
    length: { minimum: 3, maximum: 63 }, 
    format: { with: EMAIL_REGEXP, message: 'Invalid email'}
end
