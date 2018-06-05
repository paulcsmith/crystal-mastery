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
      end
    end
  end
end
