class Episodes::NewPage < MainLayout
  needs form : EpisodeForm

  def page_title
    "Add an episode"
  end

  def content
    div class: "container column is-half" do
      h1 "Add an Episode", class: "title"
      render_episode_form(@form)
    end
  end

  def render_episode_form(f)
    form_for Episodes::Create do
      field(f.title) { |i| text_input i, autofocus: "true", class: "input" }
      field(f.video_url) { |i| text_input i, class: "input" }
      field(f.description) { |i| textarea i, class: "textarea" }

      submit "Save", class: "button is-primary", data_disable_with: "Saving..."
    end
  end
end
