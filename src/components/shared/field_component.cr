class Shared::FieldComponent(T) < BaseComponent
  needs field : LuckyRecord::FillableField(T)

  def hide_label
    false
  end

  # Use text_input by default
  def render
    render do |field|
      text_input field, class: "input"
    end
  end

  def render
    div class: "field-block #{error_class}" do
      label_for @field
      yield @field
      render_errors
    end
  end

  private def error_class
    unless @field.valid?
      "-has-error"
    end
  end

  private def render_errors
    unless @field.valid?
      para class: "help is-danger" do
        text "#{label_text} #{@field.errors.join(", ")}"
      end
    end
  end

  private def label_text
    LuckyInflector::Inflector.humanize(@field.name.to_s)
  end
end
