class Episodes::New < BrowserAction
  action do
    render NewPage, form: EpisodeForm.new
  end
end
