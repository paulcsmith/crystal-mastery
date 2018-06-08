abstract class GuestLayout
  # Edit shared layout code in src/components/shared/layout.cr
  include Shared::Layout

  def render
    html_doctype

    html lang: "en" do
      shared_layout_head

      body do
        render_nav
        render_flash
        div class: "content-wrapper" do
          content
        end
        js_link asset("js/app.js")
      end
    end
  end

  def current_user
    nil
  end
end
