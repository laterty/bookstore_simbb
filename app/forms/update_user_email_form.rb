class UpdateUserEmailForm < ApplicationForm
  attr_accessor :email

  validates :email, presence: true, length: { minimum: 3, maximum: 63 }

end
