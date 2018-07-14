class Episodes::NewPage < MainLayout
  needs form : EpisodeForm

  def page_title
    "Add an episode"
  end

  def content
    div class: "narrow-container -well" do
      h1 "Add an Episode", class: "page-title"
      render_episode_form(@form)
    end
  end

  def render_episode_form(f)
    form_for Episodes::Create do
      mount Episodes::FormFields, f
      submit "Save", data_disable_with: "Saving...", class: "btn-action"
    end
  end
end
