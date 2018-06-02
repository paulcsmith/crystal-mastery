class Episodes::IndexPage < MainLayout
  needs episodes : EpisodeQuery

  def page_title
    "Episodes"
  end

  def content
    h1 "All Episodes"

    ul do
      @episodes.each do |episode|
        li episode.title
      end
    end
  end
end
