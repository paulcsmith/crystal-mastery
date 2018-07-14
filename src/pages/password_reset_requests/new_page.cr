class PasswordResetRequests::NewPage < GuestLayout
  needs form : PasswordResetRequestForm

  def page_title
    "Forgot your password?"
  end

  def content
    h1 "Reset your password"
    render_form(@form)
  end

  private def render_form(f)
    form_for PasswordResetRequests::Create do
      mount Shared::FieldComponent, f.email do |field|
        email_input field
      end
      submit "Reset Password", flow_id: "request-password-reset-button"
    end
  end
end
