module Shared::FieldErrors
  # Customize the markup and styles to match your application
  def errors_for(field : LuckyRecord::FillableField)
    unless field.valid?
      para class: "help is-danger" do
        label_text = LuckyInflector::Inflector.humanize(field.name.to_s)
        text "#{label_text} #{field.errors.join(", ")}"
      end
    end
  end
end
