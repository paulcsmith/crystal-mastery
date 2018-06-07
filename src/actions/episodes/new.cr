class Episodes::New < BrowserAction
  include Auth::RequireAdmin

  route do
    render NewPage, form: EpisodeForm.new
  end
end
