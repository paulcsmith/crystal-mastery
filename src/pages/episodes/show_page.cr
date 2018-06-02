class Episodes::ShowPage < MainLayout
  needs episode : Episode

  def page_title
    @episode.title
  end

  def content
    h1 @episode.title
    para @episode.description
  end
end
