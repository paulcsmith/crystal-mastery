require "../spec_helper"

describe "Authentication flow" do
  it "works" do
    flow = AuthenticationFlow.new("test@example.com")

    flow.sign_up "password"
    flow.should_be_signed_in
    flow.sign_out
    flow.sign_in "wrong-password"
    flow.should_have_password_error
    flow.sign_in "password"
    flow.should_be_signed_in
  end
end

private def should_be_signed_out(flow)
  flow.el("@sign-out-button").should be_on_page
end
