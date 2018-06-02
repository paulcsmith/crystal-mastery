class Home::Index < BrowserAction
  include Auth::SkipRequireSignIn

  get "/" do
    redirect Episodes::Index
  end
end
