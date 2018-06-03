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
        div class: "content-wrapper" do
          content
        end
      end
    end
  end

  def render_nav
    nav class: "main-nav" do
      div class: "left-nav" do
        link "Crystal Mastery", Episodes::Index, class: "logo"
      end

      div class: "links" do
        link "Episodes", Episodes::Index, class: "link"
        if @current_user
          link "New Episode", Episodes::New, class: "link"
        end
        sign_in_or_sign_out_link
      end
    end
  end

  private def sign_in_or_sign_out_link
    user = @current_user
    if user
      link "Sign out", to: SignIns::Delete, flow_id: "sign-out-button", class: "link"
    else
      link "Sign in", to: SignIns::New, class: "link"
    end
  end
end
