class Episodes::FormFields < BaseComponent
  needs f : EpisodeForm

  def render
    mount Shared::FieldComponent, @f.title do |field|
      text_input field, class: "input", autofocus: "true"
    end
    mount Shared::FieldComponent, @f.video_url
    mount Shared::FieldComponent, @f.description do |field|
      textarea field, class: "textarea"
    end
  end
end
