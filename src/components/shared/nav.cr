module Shared::Nav
  def render_nav(user : User? = nil)
    nav class: "main-nav" do
      div class: "left-nav" do
        link "Crystal Mastery", Episodes::Index, class: "logo"
      end

      div class: "links" do
        link "Episodes", Episodes::Index, class: "link"
        if user
          link "New Episode", Episodes::New, class: "link"
        end
        sign_in_or_sign_out_link(user)
      end
    end
  end

  private def sign_in_or_sign_out_link(user)
    if user
      link "Sign out", to: SignIns::Delete, flow_id: "sign-out-button", class: "link"
    else
      link "Sign in", to: SignIns::New, class: "link"
    end
  end
end
