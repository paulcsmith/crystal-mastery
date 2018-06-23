class Episodes::Index < BrowserAction
  include Auth::SkipRequireSignIn

  route do
    EpisodeQuery.new.title("hello").first
    render IndexPage, episodes: EpisodeQuery.new
  end
end
