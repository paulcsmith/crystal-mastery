class Episodes::Show < BrowserAction
  include Auth::SkipRequireSignIn

  action do
    render ShowPage, episode: EpisodeQuery.find(id)
  end
end
