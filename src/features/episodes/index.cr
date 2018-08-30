class Episodes::Index < BrowserAction
  include Auth::SkipRequireSignIn

  route do
    render IndexPage, episodes: EpisodeQuery.new
  end
end
