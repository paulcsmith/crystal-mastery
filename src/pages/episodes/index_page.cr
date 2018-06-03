class Episodes::IndexPage < MainLayout
  needs episodes : EpisodeQuery

  def page_title
    "Episodes"
  end

  def content
    h1 "All Episodes"

    @episodes.each do |episode|
      link episode.title, Episodes::Show.with(episode)
    end
  end
end
