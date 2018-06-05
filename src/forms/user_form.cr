class UserForm < User::BaseForm
  include PasswordValidations

  def prepare
    validate_uniqueness_of email
  end
end
