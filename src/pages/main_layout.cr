abstract class MainLayout
  # Edit shared layout code in src/components/shared/layout.cr
  include Shared::Layout

  needs current_user : User?

  def render
    html_doctype

    html lang: "en" do
      shared_layout_head

      body do
        render_nav
        render_flash
        content
      end
    end
  end

  def render_nav
    ul do
      li { link "Episodes", Episodes::Index }
      li { sign_in_or_sign_out_link }
    end
  end

  private def sign_in_or_sign_out_link
    user = @current_user
    if user
      link "Sign out", to: SignIns::Delete, flow_id: "sign-out-button"
    else
      link "Sign in", to: SignIns::New
    end
  end
end
