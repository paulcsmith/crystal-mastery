class Episodes::IndexPage < MainLayout
  needs episodes : EpisodeQuery

  def page_title
    "Episodes"
  end

  def content
  end
end
