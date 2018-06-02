class Episodes::ShowPage < MainLayout
  needs episode : Episode

  def page_title
    @episode.title
  end

  def content
    div class: "hero" do
      h1 @episode.title, class: "title"
      if @current_user
        link "Delete", Episodes::Delete.with(@episode), data_confirm: "Are you sure?"
      end
      para @episode.description, class: "subtitle"
      video src: @episode.video_url, controls: "true"
    end
  end
end
