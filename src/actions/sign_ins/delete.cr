class SignIns::Delete < BrowserAction
  include Auth::RequireSignIn

  delete "/sign_out" do
    sign_out
    flash.info = "You have been signed out"
    redirect Episodes::Index
  end
end
