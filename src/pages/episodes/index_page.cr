class Episodes::IndexPage < MainLayout
  needs episodes : EpisodeQuery

  def page_title
    "Episodes"
  end

  def content
    div class: "hero" do
      h1 "All Episodes", class: "title"
    end

    div class: "section" do
      @episodes.each do |episode|
        div class: "card" do
          div class: "card-header card-header-title" do
            link episode.title, Episodes::Show.with(episode)
          end
        end
      end
    end
  end
end
