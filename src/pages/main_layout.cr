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
        div class: "section" do
          div class: "container column is-two-thirds" do
            content
          end
        end
      end
    end
  end

  def render_nav
    nav class: "navbar has-shadow is-spaced" do
      div class: "container" do
        div class: "navbar-brand" do
          div class: "navbar-item" do
            link "Crystal Mastery", Episodes::Index
          end
        end

        div class: "navbar-end" do
          link "Episodes", Episodes::Index, class: "navbar-item"
          if @current_user
            link "New Episode", Episodes::New, class: "navbar-item"
          end
          sign_in_or_sign_out_link
        end
      end
    end
  end

  private def sign_in_or_sign_out_link
    user = @current_user
    if user
      link "Sign out", to: SignIns::Delete, flow_id: "sign-out-button", class: "navbar-item"
    else
      link "Sign in", to: SignIns::New, class: "navbar-item"
    end
  end
end
