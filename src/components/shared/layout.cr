module Shared::Layout
  macro included
    include Lucky::HTMLPage
    include Shared::FlashMessages
    include Shared::Field
    include Shared::Nav
    include AuthorizationHelpers
  end

  abstract def content

  def shared_layout_head
    head do
      utf8_charset
      title "#{page_title} - Crystal Mastery"
      css_link asset("css/app.css")
      csrf_meta_tags
      responsive_meta_tag
    end
  end

  abstract def page_title
end
