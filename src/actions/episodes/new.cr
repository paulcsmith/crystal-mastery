class Episodes::New < BrowserAction
  route do
    render NewPage, form: EpisodeForm.new
  end
end
