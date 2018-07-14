class SignUps::NewPage < GuestLayout
  needs form : SignUpForm

  def page_title
    "Sign up"
  end

  def content
    div class: "narrow-container" do
      h1 "Sign Up", class: "page-title"
      render_sign_up_form(@form)
    end
  end

  private def render_sign_up_form(f)
    form_for SignUps::Create do
      sign_up_fields(f)
      submit "Sign Up", flow_id: "sign-up-button", class: "btn-action"
    end
    link "Sign in instead", to: SignIns::New
  end

  private def sign_up_fields(f)
    mount(Shared::FieldComponent, f.email) { |i| email_input i, class: "input", autofocus: "true" }
    mount(Shared::FieldComponent, f.password) { |i| password_input i, class: "input" }
    mount(Shared::FieldComponent, f.password_confirmation) { |i| password_input i, class: "input" }
  end
end
