class Episodes::NewPage < MainLayout
  needs form : EpisodeForm

  def page_title
    "Add an episode"
  end

  def content
    h1 "Add an Episode"
    render_episode_form(@form)
  end

  def render_episode_form(f)
    form_for Episodes::Create do
      field(f.title) { |i| text_input i, autofocus: "true" }
      field(f.description) { |i| textarea i, autofocus: "true" }

      submit "Save", data_disable_with: "Saving..."
    end
  end
end
