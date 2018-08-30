class Episodes::Comments::Create < BrowserAction
  include Auth::RequireSignIn

  nested_route do
    CommentForm.create(params, episode_id: episode.id, author_id: current_user.id) do |form, comment|
      if comment
        flash.success = "Comment saved"
        redirect Episodes::Show.with(episode)
      else
        render Episodes::ShowPage, episode: episode, comment_form: form
      end
    end
  end

  private def episode
    EpisodeQuery.new.preload(CommentQuery.new.preload_author).find(episode_id)
  end
end
