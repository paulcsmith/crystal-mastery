class SignIns::NewPage < GuestLayout
  needs form : SignInForm

  def page_title
    "Sign in"
  end

  def content
    div class: "narrow-container -well" do
      h1 "Sign In", class: "page-title"
      render_sign_in_form(@form)
    end
  end

  private def render_sign_in_form(f)
    form_for SignIns::Create do
      sign_in_fields(f)
      submit "Sign In", flow_id: "sign-in-button", class: "btn-action"
    end
    link "Reset password", to: PasswordResetRequests::New
    text " | "
    link "Sign up", to: SignUps::New
  end

  private def sign_in_fields(f)
    field(f.email) { |i| email_input i, class: "input", autofocus: "true" }
    field(f.password) { |i| password_input i, class: "input" }
  end
end
