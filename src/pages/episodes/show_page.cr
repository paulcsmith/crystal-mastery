class Episodes::ShowPage < MainLayout
  needs episode : Episode

  def page_title
    @episode.title
  end

  def content
    published_at
    h1 @episode.title, class: "page-title"
    video src: @episode.video_url, controls: "true"
    para @episode.description
    delete_button
  end

  def published_at
    h2 class: "subtitle-text" do
      text "Published "
      time_ago_in_words @episode.created_at
      text " ago"
    end
  end

  def delete_button
    if @current_user
      link "Delete", Episodes::Delete.with(@episode), data_confirm: "Are you sure?"
    end
  end
end
