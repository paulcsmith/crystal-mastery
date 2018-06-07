class SignUpForm < User::BaseForm
  # Change password validations in src/forms/mixins/password_validations.cr
  include PasswordValidations

  fillable email
  virtual password : String
  virtual password_confirmation : String

  def prepare
    admin.value = false
    validate_uniqueness_of email
    run_password_validations
    Authentic.copy_and_encrypt password, to: encrypted_password
  end
end
