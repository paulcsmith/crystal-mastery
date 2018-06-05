class Episodes::Show < BrowserAction
  include Auth::SkipRequireSignIn

  action do
    render ShowPage, episode: episode, comment_form: CommentForm.new
  end

  def episode
    EpisodeQuery.new.preload(CommentQuery.new.preload_author).find(id)
  end
end
