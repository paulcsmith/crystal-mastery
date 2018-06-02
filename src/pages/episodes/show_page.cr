class Episodes::ShowPage < MainLayout
  needs episode : Episode

  def page_title
    @episode.title
  end

  def content
    div class: "hero" do
      h1 @episode.title, class: "title"
      para @episode.description, class: "subtitle"
    end
  end
end
