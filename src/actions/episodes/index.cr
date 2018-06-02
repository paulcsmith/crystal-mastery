class Episodes::Index < BrowserAction
  include Auth::SkipRequireSignIn

  action do
    render IndexPage, episodes: EpisodeQuery.new
  end
end
