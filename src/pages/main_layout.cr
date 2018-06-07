abstract class MainLayout
  # Edit shared layout code in src/components/shared/layout.cr
  include Shared::Layout

  private getter current_user
  needs current_user : User?

  def render
    html_doctype

    html lang: "en" do
      shared_layout_head

      body do
        render_nav(@current_user)
        render_flash
        div class: "content-wrapper" do
          content
        end
      end
    end
  end

  def when_admin
    user = @current_user
    if user.try(&.admin?)
      yield
    end
  end
end
