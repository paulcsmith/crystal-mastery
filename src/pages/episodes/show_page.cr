class Episodes::ShowPage < MainLayout
  needs episode : Episode
  needs comment_form : CommentForm

  def page_title
    @episode.title
  end

  def content
    published_at
    h1 @episode.title, class: "page-title"
    div class: "screencast-block" do
      tag "iframe",
        src: @episode.video_url,
        frameborder: "0",
        "allowFullScreen": "true",
        "mozallowfullscreen": "true",
        "webkitAllowFullScreen": "true"
    end
    para class: "page-summary" do
      simple_format @episode.description
    end
    delete_button
    render_comments_section
  end

  def render_comments_section
    div class: "narrow-container -well" do
      render_comments
      if @current_user
        render_comment_form(@comment_form)
      end
    end
  end

  def render_comments
    h2 "Comments", class: "section-title"

    @episode.comments.each do |comment|
      div class: "comment-block" do
        para class: "body" do
          strong comment.author.email
          text " - "
          text comment.body
        end
      end
    end
  end

  def render_comment_form(f)
    h2 "Leave a comment", class: "section-title -pushed-down"
    form_for Episodes::Comments::Create.with(@episode) do
      field(f.body, hide_label: true) { |i| textarea i, class: "textarea", autofocus: "true" }
      submit "Post Comment", class: "btn-action"
    end
  end

  def published_at
    h2 class: "subtitle-text" do
      text "Published "
      time_ago_in_words @episode.created_at
      text " ago"
    end
  end

  def delete_button
    when_admin do
      link "Delete", Episodes::Delete.with(@episode), data_confirm: "Are you sure?"
    end
  end
end
